return {
	"folke/which-key.nvim",
	event = "VimEnter",
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("which-key").setup({
			---@param ctx { mode: string, operator: string }
			defer = function(ctx)
				if vim.list_contains({ "d", "y" }, ctx.operator) then
					return true
				end
				return vim.list_contains({ "v", "<C-V>", "V" }, ctx.mode)
			end,
			preset = "modern",
			show_help = false,
			icons = {
				colors = true,
				keys = {
					Up = "􀄨",
					Down = "􀄩",
					Left = "􀄪",
					Right = "􀄫",
					C = "􀆍",
					M = "􀆕",
					S = "􀆝",
					CR = "􀅇",
					Esc = "􀆧",
					ScrollWheelDown = "󱕐",
					ScrollWheelUp = "󱕑",
					NL = "􀅇",
					BS = "􁂉",
					Space = "󱁐",
					Tab = "􀅂",
				},
			},
		})

		-- Document existing key chains
		require("which-key").add({
			{ "<leader>f", group = "file" }, -- group
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
			{
				"<leader>fb",
				function()
					print("hello")
				end,
				desc = "Foobar",
			},
			{ "<leader>fn", desc = "New File" },
			{ "<leader>f1", hidden = true }, -- hide this keymap
			-- { "<leader>w", proxy = "<c-w>", group = "windows" }, -- proxy to window mappings
			{
				"<leader>b",
				group = "buffers",
				expand = function()
					return require("which-key.extras").expand.buf()
				end,
			},
			-- {
			--   -- Nested mappings are allowed and can be added in any order
			--   -- Most attributes can be inherited or overridden on any level
			--   -- There's no limit to the depth of nesting
			--   mode = { "n", "v" }, -- NORMAL and VISUAL mode
			--   { "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
			--   { "<leader>w", "<cmd>w<cr>", desc = "Write" },
			-- }
		})
	end,
}
