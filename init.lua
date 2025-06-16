-- 基础配置
require('custom.basic')

-- 按键映射
require('custom.keybindings')

-- Lazy插件管理
require('lazynvim-init')

-- 批量替换
require('custom.replace')

-- LSP配置
require('custom.lsp')

-- 配色方案
vim.cmd.colorscheme "dracula"
