-- -- utf8
-- vim.g.encoding = "UTF-8"
-- vim.o.fileencoding = 'utf-8'
-- -- jk移动时光标下上方保留8行
-- vim.o.scrolloff = 8
-- vim.o.sidescrolloff = 8
-- -- 使用相对行号
-- vim.wo.number = true
-- vim.wo.relativenumber = true
-- -- 高亮所在行
-- vim.wo.cursorline = true
-- -- 显示左侧图标指示列
-- vim.wo.signcolumn = "yes"
-- -- 右侧参考线，超过表示代码太长了，考虑换行
-- vim.wo.colorcolumn = "160"
-- -- 新行对齐当前行，空格替代tab
-- vim.o.expandtab = true
-- vim.bo.expandtab = true
-- vim.o.autoindent = true
-- vim.bo.autoindent = true
-- vim.o.smartindent = true
-- -- 搜索大小写不敏感，除非包含大写
-- vim.o.ignorecase = true
-- vim.o.smartcase = true
-- -- 搜索不要高亮
-- vim.o.hlsearch = false
-- -- 边输入边搜索
-- vim.o.incsearch = true
-- -- 使用增强状态栏后不再需要 vim 的模式提示
-- vim.o.showmode = false
-- -- 命令行高为2，提供足够的显示空间
-- vim.o.cmdheight = 2
-- -- 当文件被外部程序修改时，自动加载
-- vim.o.autoread = true
-- vim.bo.autoread = true
-- -- 禁止折行
-- vim.o.wrap = false
-- vim.wo.wrap = false
-- -- 行结尾可以跳到下一行
-- vim.o.whichwrap = 'b,s,<,>,[,],h,l'
-- -- 允许隐藏被修改过的buffer
-- vim.o.hidden = true
-- -- 鼠标支持
-- vim.o.mouse = "a"
-- -- 禁止创建备份文件
-- vim.o.backup = false
-- vim.o.writebackup = false
-- vim.o.swapfile = false
-- -- smaller updatetime 
-- vim.o.updatetime = 300
-- -- 等待mappings
-- vim.o.timeoutlen = 100
-- -- split window 从下边和右边出现
-- vim.o.splitbelow = true
-- vim.o.splitright = true
-- -- 自动补全不自动选中
-- vim.g.completeopt = "menu,menuone,noselect,noinsert"
-- -- 样式
-- vim.o.background = "dark"
-- vim.o.termguicolors = true
-- vim.opt.termguicolors = true
-- -- 不可见字符的显示，这里只把空格显示为一个点
-- vim.o.list = true
-- vim.o.listchars = "space:·"
-- -- 补全增强
-- vim.o.wildmenu = true
-- -- Dont' pass messages to |ins-completin menu|
-- vim.o.shortmess = vim.o.shortmess .. 'c'
-- vim.o.pumheight = 10
-- -- always show tabline
-- vim.o.showtabline = 0

-- 透明背景
-- {
vim.cmd('au ColorScheme * hi Normal guibg=NONE ctermbg=NONE')
vim.cmd('au ColorScheme * hi NonText guibg=NONE ctermbg=NONE')
vim.cmd('au ColorScheme * hi SignColumn guibg=NONE ctermbg=NONE')

-- LSP
vim.cmd('autocmd ColorScheme * highlight Pmenu guibg=NONE ctermbg=NONE')
vim.cmd('autocmd ColorScheme * highlight PmenuSel guibg=NONE ctermbg=NONE')
-- }

-- 回到上次编辑位置
vim.api.nvim_create_autocmd({ 'BufRead', 'BufReadPost' }, {
  callback = function()
    local row, column = unpack(vim.api.nvim_buf_get_mark(0, '"'))
    local buf_line_count = vim.api.nvim_buf_line_count(0)

    if row >= 1 and row <= buf_line_count then
      vim.api.nvim_win_set_cursor(0, { row, column })
    end
  end,
})

vim.loader.enable()
vim.g.mapleader = "'"
vim.g.maplocalleader = "'"
vim.g.have_nerd_font = true
vim.g.markdown_folding = 1
vim.opt.linebreak = true
vim.g.simple_indicator_on = false
vim.opt.winborder = 'single'

-- [[ Setting options ]]
-- See `:help vim.opt`
--  For more options, you can see `:help option-list`
vim.opt.termguicolors = true

-- Make line numbers default
vim.opt.relativenumber = true
vim.opt.number = true

-- enable soft line wrap
vim.opt.wrap = true

-- only one statusline
vim.opt.laststatus = 3

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'auto'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeout = false

-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 5

-- Big file limit
vim.g.bigfile_size = 1024 * 1024 * 1.5 -- 1.5 MB

-- 缩进2个空格等于一个Tab
vim.opt.tabstop = 2
vim.bo.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftround = true
-- >> << 时移动长度
vim.opt.shiftwidth = 2
vim.bo.shiftwidth = 2
