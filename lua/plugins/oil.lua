return {
	"stevearc/oil.nvim",
	lazy = false,
	keys = {
		{ "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
	},
	dependencies = { "echasnovski/mini.icons" },
	config = function()
		require("plugins.config.oil")
	end,
}
