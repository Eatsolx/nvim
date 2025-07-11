-- 设置UTF-8编码
vim.g.encoding = "UTF-8"
vim.o.fileencoding = 'utf-8'
-- -- jk移动时光标下上方保留8行
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
-- -- 右侧参考线，超过表示代码太长了，考虑换行
-- vim.wo.colorcolumn = "160"
-- -- 搜索不要高亮
-- vim.o.hlsearch = false
-- 当文件被外部程序修改时，自动加载
vim.o.autoread = true
vim.bo.autoread = true
-- 行结尾可以跳到下一行
vim.o.whichwrap = 'b,s,<,>,[,],h,l'

-- 透明背景
-- {
vim.cmd('au ColorScheme * hi Normal guibg=NONE ctermbg=NONE')
vim.cmd('au ColorScheme * hi NonText guibg=NONE ctermbg=NONE')
vim.cmd('au ColorScheme * hi SignColumn guibg=NONE ctermbg=NONE')

-- 语言服务器协议 (LSP)
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

-- [[ 设置选项 ]]
-- 参见 `:help vim.opt`
--  更多选项请查看 `:help option-list`
vim.opt.termguicolors = true

-- 默认显示行号
vim.opt.relativenumber = true
vim.opt.number = true

-- 启用软换行
vim.opt.wrap = false

-- 全局状态栏（仅显示一个）
vim.opt.laststatus = 3

-- 启用鼠标模式（例如调整窗口分割时有用）
vim.opt.mouse = 'a'

-- 不在状态栏重复显示模式信息
vim.opt.showmode = false

-- 同步系统剪贴板与Neovim
vim.opt.clipboard = 'unnamedplus'

-- 启用断行缩进
vim.opt.breakindent = true

-- 保存撤销历史
vim.opt.undofile = true

-- 忽略大小写搜索（除非包含大写字母或使用 \C）
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- 默认显示标记栏
vim.opt.signcolumn = 'auto'

-- 缩短更新间隔
vim.opt.updatetime = 250

-- 禁用映射序列超时
vim.o.timeout = false

-- 加快which-key弹出显示
vim.opt.timeoutlen = 300

-- 新分割窗口打开位置
vim.opt.splitright = true
vim.opt.splitbelow = true

-- 设置空白字符显示方式
--  参见 `:help 'list'`
--  及 `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- 实时预览替换效果
vim.opt.inccommand = 'split'

-- 高亮光标所在行
vim.opt.cursorline = true

-- 光标上下保留的最小行数
-- vim.opt.scrolloff = 5

-- 大文件检测阈值
vim.g.bigfile_size = 1024 * 1024 * 1.5 -- 1.5 MB

-- 缩进4个空格等于一个Tab
vim.opt.tabstop = 4
vim.bo.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftround = true
-- >> << 缩进操作步长
vim.opt.shiftwidth = 4
vim.bo.shiftwidth = 4

-- AutoPairs插件快捷键设置
vim.g.AutoPairsShortcutToggle = '<C-a>t'
vim.g.AutoPairsFlyMode = 1
vim.g.AutoPairsShortcutBackInsert = '<C-a>i'
