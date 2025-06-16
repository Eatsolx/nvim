-- Map Leader
vim.g.mapleader = "'"

-- 设置leader键停留时间
vim.o.timeoutlen = 1000

-- 保存本地变量
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- map('模式','按键','映射', opts)

-- ESC
map("i", "<C-c>", "<Esc>")

-- Save & Quit
map("n", "<C-s>", ":w<CR>", opts)
map("n", "<C-q>", ":q<CR>", opts)

-- 快捷缩进
map('v', '<', '<gv')
map('v', '>', '>gv')

-- 分屏
map("n", "s=", ":vsp<CR>")
map("n", "s-", ":sp<CR>")
map("n", "sc", "<C-w>c")
map("n", "so", "<C-w>o") -- close others

-- undoTree
map("n", '<leader>u', ':UndotreeToggle<CR>', opts)

-- 清除高亮
map("n", "<leader>h", ":nohlsearch<CR>", opts)

-- 剪切板
-- map({"n", "v"}, "y", [["+y]], opts)
-- map({"n", "v"}, "<leader>p", [["+p]], opts)
