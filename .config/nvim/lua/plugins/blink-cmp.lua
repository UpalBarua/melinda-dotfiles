return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
	version = "1.*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "default",
			["<C-k>"] = { "select_prev", "fallback" },
			["<C-j>"] = { "select_next", "fallback" },
			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },
			["<C-Space>"] = { "show", "fallback" },
			["<C-e>"] = { "hide", "fallback" },
			["<CR>"] = { "accept", "fallback" },
			["<Tab>"] = {
				function(cmp)
					if cmp.is_visible() then
						return cmp.select_next()
					elseif cmp.snippet_forward() then
						return true
					end
					return false
				end,
				"fallback",
			},
			["<S-Tab>"] = {
				function(cmp)
					if cmp.is_visible() then
						return cmp.select_prev()
					elseif cmp.snippet_backward() then
						return true
					end
					return false
				end,
				"fallback",
			},
		},

		cmdline = { enabled = true },
		completion = {
			-- menu = { border = "rounded" },
			documentation = {
				auto_show = true,
				-- window = { border = "rounded"}
			},
			ghost_text = { enabled = true },
		},
		signature = { window = { border = "rounded" } },
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
