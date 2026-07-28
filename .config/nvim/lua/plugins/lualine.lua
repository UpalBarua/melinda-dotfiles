return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			theme = "tokyonight-night",
			section_separators = " ",
			component_separators = " ",
		},
		sections = {
			lualine_a = {
				{
					"filename",
					symbols = {
						modified = " ",
						readonly = "󰌾 ",
						unnamed = "",
						newfile = "",
					},
				},
			},
			lualine_b = {
				{ "branch", icon = "" },
			},
			lualine_c = {
				"diagnostics",
			},
			lualine_x = {
				{
					"diff",
					symbols = { added = " ", modified = " ", removed = "󰛲 " },
				},
			},
			lualine_y = {
				"filetype",
			},
			lualine_z = {
				"mode",
			},
		},
	},
}
