return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff" },
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			javascriptreact = { "prettierd" },
			typescriptreact = { "prettierd" },
			css = { "prettierd" },
			html = { "prettierd" },
			json = { "prettierd" },
			yaml = { "prettierd" },
			markdown = { "prettierd" },
			nix = { "nixfmt" },
			shell = { "shfmt" },
			kdl = { "kdlfmt" },
		},
		format_on_save = nil,
	},
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({
					lsp_fallback = true,
					async = false, -- from lazyvim
					timeout = 3000, -- from lazyvim
					quiet = false, -- from lazyvim
				})
			end,
		},
	},
}
