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

-- undoTree
map("n", '<leader>u', ':UndotreeToggle<CR>', opts)

-- 清除高亮
map("n", "<leader>h", ":nohlsearch<CR>", opts)

-- code_runner
map('n', '<leader>rr', ':RunCode<CR>', { noremap = true, silent = false })
map('n', '<leader>rf', ':RunFile<CR>', { noremap = true, silent = false })
map('n', '<leader>rft', ':RunFile tab<CR>', { noremap = true, silent = false })
map('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = false })
map('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = false })
map('n', '<leader>crf', ':CRFiletype<CR>', { noremap = true, silent = false })
map('n', '<leader>crp', ':CRProjects<CR>', { noremap = true, silent = false })

