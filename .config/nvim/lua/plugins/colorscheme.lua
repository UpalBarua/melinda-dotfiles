return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme tokyonight-night]])
      -- vim.o.background = "dark"
			-- vim.cmd([[hi normal guibg=NONE ctermbg=NONE]])
		end,
	},
}
