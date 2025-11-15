return {
	"saghen/blink.cmp",
	event = { "BufReadPost", "BufNewFile" },
	version = "1.*",
	opts = {
		completion = {
			documentation = {
				auto_show = true,
			},
		},
		keymap = {
			["<C-u>"] = { "scroll_documentation_up", "fallback" },
			["<C-d>"] = { "scroll_documentation_down", "fallback" },
			["<Tab>"] = {
				"snippet_forward",
				"select_next",
				function(cmp)
				  if has_words_before() or vim.api.nvim_get_mode().mode == "c" then return cmp.show() end
				end,
				"fallback",
			},
			["<S-Tab>"] = {
			    "select_prev",
			    "snippet_backward",
			    function(cmp)
					if vim.api.nvim_get_mode().mode == "c" then return cmp.show() end
			    end,
			    "fallback",
			},
			-- ["<CR>"] = { "accept", "fallback" },
			["<C-e>"] = { "hide", "fallback" },
		},
		signature = {
			enabled = true,
		},
		cmdline = {
			completion = {
				menu = {
					auto_show = true,
				},
			},
		},
		sources = {
			providers = {
				snippets = { score_offset = 1000 },
			},
		},
	},
}
