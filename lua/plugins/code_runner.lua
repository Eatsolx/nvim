return {
    'CRAG666/code_runner.nvim',
    cmd = {
        'RunCode',
        'RunFile',
        'RunProject',
    },
    config = function()
        require 'plugins.config.code_runner'
    end,
}
