return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "tokyonight",
				section_separators = "",
				component_separators = "",
				ignore_focus = { "NvimTree", "Alpha" },
			},
			sections = {
				lualine_a = { "buffers" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = { "diagnostics" },
				lualine_y = { "location" },
				lualine_z = { "branch" },
			},
		})
	end,
}
