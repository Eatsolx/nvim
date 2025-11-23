vim.lsp.enable 'lua_ls'
vim.lsp.enable 'clangd'
vim.lsp.enable 'markdown_oxide'
vim.lsp.enable 'pyright'

-- 确保已安装 lspsaga 插件 (https://github.com/nvimdev/lspsaga.nvim)

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
    callback = function(event)
        local bufnr = event.buf

        -- 使用 lspsaga 的键映射
        -- 跳转到定义 (带预览)
        vim.keymap.set('n', 'gd', '<cmd>Lspsaga peek_definition<CR>', { buffer = bufnr, silent = true, noremap = true, desc = 'LSP: Peek Definition' })

        -- 跳转到声明
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr, desc = 'LSP: Goto Declaration' })

        -- 查找引用
        vim.keymap.set('n', 'gr', '<cmd>Lspsaga lsp_finder<CR>', { buffer = bufnr, silent = true, noremap = true, desc = 'LSP: Find References' })

        -- 代码操作
        vim.keymap.set(
            { 'n', 'v' },
            '<leader>la',
            '<cmd>Lspsaga code_action<CR>',
            { buffer = bufnr, silent = true, noremap = true, desc = 'LSP: Code Actions' }
        )

        -- 重命名符号
        vim.keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', { buffer = bufnr, silent = true, noremap = true, desc = 'LSP: Rename' })

        -- 显示当前行诊断
        vim.keymap.set(
            'n',
            '<leader>ld',
            '<cmd>Lspsaga show_line_diagnostics<CR>',
            { buffer = bufnr, silent = true, noremap = true, desc = 'LSP: Show Line Diagnostic' }
        )

        -- 显示光标位置诊断
        vim.keymap.set(
            'n',
            '<leader>cd',
            '<cmd>Lspsaga show_cursor_diagnostics<CR>',
            { buffer = bufnr, silent = true, noremap = true, desc = 'LSP: Show Cursor Diagnostic' }
        )

        -- 跳转到实现
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = bufnr, desc = 'LSP: Goto Implementation' })

        -- 诊断导航
        vim.keymap.set('n', 'gp', vim.diagnostic.goto_prev, { buffer = bufnr, desc = 'LSP: Previous Diagnostic' })
        vim.keymap.set('n', 'gn', vim.diagnostic.goto_next, { buffer = bufnr, desc = 'LSP: Next Diagnostic' })
        vim.keymap.set('n', 'go', vim.diagnostic.open_float, { buffer = bufnr, desc = 'LSP: Open Diagnostic Float' })

        -- 显示文档
        vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', { buffer = bufnr, silent = true, noremap = true, desc = 'LSP: Show Documentation' })

        -- 切换诊断显示
        vim.keymap.set(
            'n',
            '<leader>td',
            (function()
                local diag_status = 1 -- 1 is show; 0 is hide
                return function()
                    if diag_status == 1 then
                        diag_status = 0
                        vim.diagnostic.config { underline = false, virtual_text = false, signs = false, update_in_insert = false }
                    else
                        diag_status = 1
                        vim.diagnostic.config { underline = true, virtual_text = true, signs = true, update_in_insert = true }
                    end
                end
            end)(),
            { buffer = bufnr, desc = 'LSP: Toggle diagnostics display' }
        )

        -- 折叠功能
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.supports_method 'textDocument/foldingRange' then
            local win = vim.api.nvim_get_current_win()
            vim.wo[win].foldexpr = 'v:lua.vim.lsp.foldexpr()'
        end

        -- 内联提示
        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            vim.keymap.set('n', '<leader>th', function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = bufnr })
            end, { buffer = bufnr, desc = 'LSP: Toggle Inlay Hints' })
        end

        -- 符号高亮
        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) and vim.bo.filetype ~= 'bigfile' then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })

            -- 光标停留时高亮符号
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                buffer = bufnr,
                group = highlight_augroup,
                callback = vim.lsp.buf.document_highlight,
            })

            -- 光标移动时清除高亮
            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                buffer = bufnr,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
            })

            -- LSP 分离时清理
            vim.api.nvim_create_autocmd('LspDetach', {
                group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
                callback = function(event2)
                    vim.lsp.buf.clear_references()
                    vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
                end,
            })
        end
    end,
})

-- diagnostic UI touches
-- local icons = require 'ui.icons'
vim.diagnostic.config {
    -- virtual_lines = { current_line = true },
    virtual_text = {
        spacing = 5,
        prefix = '◍ ',
    },
    float = { severity_sort = true },
    severity_sort = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN] = '',
            [vim.diagnostic.severity.INFO] = '',
            [vim.diagnostic.severity.HINT] = '',
        },
    },
}

local api, lsp = vim.api, vim.lsp
api.nvim_create_user_command('LspInfo', ':checkhealth vim.lsp', { desc = 'Alias to `:checkhealth vim.lsp`' })
api.nvim_create_user_command('LspLog', function()
    vim.cmd(string.format('tabnew %s', lsp.get_log_path()))
end, {
    desc = 'Opens the Nvim LSP client log.',
})
local complete_client = function(arg)
    return vim.iter(vim.lsp.get_clients())
        :map(function(client)
            return client.name
        end)
        :filter(function(name)
            return name:sub(1, #arg) == arg
        end)
        :totable()
end
api.nvim_create_user_command('LspRestart', function(info)
    for _, name in ipairs(info.fargs) do
        if vim.lsp.config[name] == nil then
            vim.notify(("Invalid server name '%s'"):format(info.args))
        else
            vim.lsp.enable(name, false)
        end
    end

    local timer = assert(vim.uv.new_timer())
    timer:start(500, 0, function()
        for _, name in ipairs(info.fargs) do
            vim.schedule_wrap(function(x)
                vim.lsp.enable(x)
            end)(name)
        end
    end)
end, {
    desc = 'Restart the given client(s)',
    nargs = '+',
    complete = complete_client,
})
