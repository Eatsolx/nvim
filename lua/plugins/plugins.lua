return {
  -- Themes
  {'Mofiqul/dracula.nvim'},

  -- 快速分析启动时间
  {
    'dstein64/vim-startuptime',
    event = "VeryLazy",
    -- cmd = "startuptime",
  },

  -- 制作markdown表格
  {
    'dhruvasagar/vim-table-mode',
    ft = "markdown",
    -- cmd = "tablemodetoggle",
    event = "VeryLazy",
  },

  {
    'tpope/vim-sleuth',
    event = { 'BufReadPost', 'BufNewFile' }
  },

  {
    'folke/todo-comments.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {}
  },
}

