require('leap').setup {
    -- 配置双向跳转（按一次键覆盖上下方向）
    vim.keymap.set({ 'n', 'x', 'o' }, 's', function()
        require('leap').leap { target_windows = { vim.fn.win_getid() } }
    end),
    safe_labels = { 'a', 'b', 'c', 'd', 'e', 'g', 'h', 'i', 'j', 'k', 'l', 'n', 'o', 'p', 'q', 'r', 't', 'u', 'v', 'w', 'x', 'y', 'z' }, -- 排除冲突键（如 `s`）
    labels = { 's', 'f', 'm', 'z' }, -- 次要标签集（安全标签不够时启用）
    max_phase_one_targets = 50, -- 提高预览目标数
    case_sensitive = false, -- 忽略大小写
    special_keys = {
        repeat_search = '<enter>', -- 重复上一次跳转
    },
}
