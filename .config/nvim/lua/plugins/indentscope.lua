return {
	"echasnovski/mini.indentscope",
	version = "*",
	config = function()
		require("mini.indentscope").setup({
			draw = {
				animation = function()
					return 0
				end,
			},
			symbol = "│",
		})
	end,
}
