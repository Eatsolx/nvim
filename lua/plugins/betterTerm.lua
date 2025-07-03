return {
  'CRAG666/betterTerm.nvim',
  keys = {
    {
      mode = { 'n', 't' },
      '<A-;>',
      function()
        require('betterTerm').open()
      end,
      desc = 'Open BetterTerm 0',
    },
    {
      mode = { 'n', 't' },
      '<A-/>',
      function()
        require('betterTerm').open(1)
      end,
      desc = 'Open BetterTerm 1',
    },
    {
      '<leader>tt',
      function()
        require('betterTerm').select()
      end,
      desc = 'Select terminal',
    }
  },

  config = function()
    require "plugins.config.betterTerm"
  end,
}
