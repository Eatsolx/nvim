-- 自动切换输入法
return {
    'Eatsolx/im_switch.nvim',
    config = function()
        require('im_switch').setup {
            layout = 'com.apple.keylayout.ABC', -- 目标输入法
        }
    end,
    event = 'InsertEnter',
}
