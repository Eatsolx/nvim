-- markdown-preview.nvim 插件配置
vim.g.mkdp_auto_start = 0 -- 设置为 1 时，进入 Markdown 缓冲区后自动打开预览窗口（默认 0）
vim.g.mkdp_auto_close = 1 -- 设置为 1 时，从 Markdown 缓冲区切换到其他缓冲区时自动关闭预览（默认 1）
vim.g.mkdp_refresh_slow = 0 -- 设置为 1 时，保存缓冲区或离开插入模式才刷新预览（默认 0 表示实时刷新）
vim.g.mkdp_command_for_global = 0 -- 设置为 1 时，所有文件都可使用 MarkdownPreview 命令（默认仅 markdown 文件）
vim.g.mkdp_open_to_the_world = 0 -- 设置为 1 时，预览服务器可被局域网访问（默认仅本地 127.0.0.1）
vim.g.mkdp_open_ip = "" -- 自定义预览 IP（用于远程开发）
vim.g.mkdp_browser = "" -- 指定打开预览的浏览器（含空格的路径需用单反斜杠）
vim.g.mkdp_echo_preview_url = 1 -- 设置为 1 时，在命令行回显预览 URL（默认 0）
vim.g.mkdp_browserfunc = "" -- 自定义打开预览页的 Vim 函数（接收 URL 参数）
vim.g.mkdp_port = "" -- 指定服务器端口（空表示随机）

-- Markdown 渲染选项
vim.g.mkdp_preview_options = {
	mkit = {},
	katex = {},
	uml = {},
	maid = {},
	disable_sync_scroll = 0, -- 是否禁用同步滚动（默认 0）
	sync_scroll_type = "middle", -- 同步滚动方式：'middle', 'top', 'relative'
	hide_yaml_meta = 1, -- 是否隐藏 YAML 元数据（默认 1）
	sequence_diagrams = {},
	flowchart_diagrams = {},
	content_editable = false, -- 是否启用预览页内容编辑
	disable_filename = 0, -- 是否隐藏文件名标题
	toc = {}, -- 目录选项
}

-- 自定义样式路径
vim.g.mkdp_markdown_css = "" -- 自定义 Markdown CSS 文件路径
vim.g.mkdp_highlight_css = "" -- 自定义代码高亮 CSS 文件路径
vim.g.mkdp_page_title = "「${name}」" -- 预览页标题（${name} 替换为文件名）
vim.g.mkdp_images_path = "/home/user/.markdown_images" -- 自定义图片存储路径

-- 文件类型识别
vim.g.mkdp_filetypes = { "markdown" } -- 启用预览的文件类型

-- 主题设置
vim.g.mkdp_theme = "light" -- 默认主题（'dark'/'light'，默认跟随系统）

-- 组合预览窗口
vim.g.mkdp_combine_preview = 1 -- 设置为 1 时复用预览窗口（默认 0）
vim.g.mkdp_combine_preview_auto_refresh = 1 -- 组合预览时自动刷新内容（需开启 combine_preview）
