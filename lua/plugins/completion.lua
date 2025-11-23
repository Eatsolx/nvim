return {
    'saghen/blink.cmp',
    event = { 'BufReadPost', 'BufNewFile' },
    version = 'v0.*', -- 建议改为 v0.* 这里的版本号更稳定，或者直接用 "*"
    -- build = "cargo build --release", -- 如果报错说找不到库，解开这一行重新编译

    opts = {
        -- 外观设置
        completion = {
            documentation = { auto_show = true },
            -- 必须把 list 设置为 manual 或者 auto_insert = false，
            -- 否则 super-tab 模式下会自动选中第一项，导致逻辑混乱
            list = { selection = { preselect = false, auto_insert = true } },
        },

        -- 关键修复：显式定义按键，不再完全依赖 preset
        keymap = {
            preset = 'super-tab', -- 保留这个以获取其他没定义的键位的默认值

            -- 1. 强制定义 Tab：菜单选下一个 -> 代码片段跳转 -> 默认 Tab
            ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },

            -- 2. 强制定义 Shift-Tab：菜单选上一个 -> 代码片段回退 -> 默认 S-Tab
            ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },

            -- 3. 强制定义回车：接受补全 -> 否则回退 (触发 autopairs)
            ['<CR>'] = { 'accept', 'fallback' },

            -- 4. 你自定义的其他按键
            ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
            ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
            ['<C-e>'] = { 'hide', 'fallback' },
        },

        signature = { enabled = true },

        -- 如果你需要 cmdline 也生效，通常不需要额外配置，除非你要改 cmdline 的专用按键
        cmdline = {
            completion = { menu = { auto_show = true } },
        },

        sources = {
            providers = {
                snippets = { score_offset = 1000 },
            },
        },
    },
}
