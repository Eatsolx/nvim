local status, null_ls = pcall(require, 'null-ls')
if not status then
    return
end

null_ls.setup {
    sources = {
        null_ls.builtins.diagnostics.eslint_d.with {
            diagnostics_format = '[eslint] #{m}\n(#{c})',
        },
        null_ls.builtins.diagnostics.fish,
    },
    on_attach = function(client)
        if client.name == 'null-ls' then
            -- 确保不禁用 vue_ls 的诊断
        end
    end,
}
