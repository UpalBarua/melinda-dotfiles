return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({})
		vim.cmd.colorscheme("tokyonight-night")
		vim.g.tokyonight_dark_float = false
	end,
}
