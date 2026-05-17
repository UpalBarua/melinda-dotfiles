return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install({
			"c",
			"lua",
			"vim",
			"vimdoc",
			"query",
			"markdown",
			"markdown_inline",
			"python",
			"javascript",
			"typescript",
			"regex",
			"json",
			"gitignore",
			"yaml",
			"make",
			"cmake",
			"bash",
			"tsx",
			"css",
			"html",
		})
	end,
}
