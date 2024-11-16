return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			transparent = true,
			styles = {
				floats = "transparent",
			},
		})
		vim.cmd.colorscheme("tokyonight")
		vim.g.tokyonight_dark_float = false
	end,
}
