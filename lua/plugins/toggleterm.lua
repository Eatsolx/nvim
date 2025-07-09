return {
	-- amongst your other plugins
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("plugins.config.toggleterm")
	end,
}
