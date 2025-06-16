vim.keymap.set("v", "<leader>s", function()
    vim.cmd('normal! "zy')
    local selected = vim.fn.getreg('z')
    
    local replace = vim.fn.input("替换 '"..selected.."' 为: ")
    if replace ~= "" then
        -- 执行替换并清除高亮
        vim.cmd(':%s/'..vim.fn.escape(selected, '/\\')..'/'..vim.fn.escape(replace, '/')..'/g | nohlsearch')
        print("已替换 '"..selected.."' → '"..replace.."'")
    else
        print("替换已取消")
    end
end, {
    noremap = true,
    desc = "全局替换（带确认）"
})
