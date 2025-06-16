return {
  'nvimdev/lspsaga.nvim',
  event = 'VeryLazy',
  config = function()
    require('lspsaga').setup {
      ui = {
        code_action = '',
        border = 'rounded', -- 与全局一致
        title = true,
        winblend = 10,
        expand = '',
        collapse = '',
      },
      lightbulb = {
        enable = false,
        virtual_text = false,
      },
    }
  end,
}
