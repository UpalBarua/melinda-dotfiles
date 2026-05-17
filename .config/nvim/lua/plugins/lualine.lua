return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "rose-pine",
				section_separators = " ",
				component_separators = " ",
			},
			sections = {
				lualine_a = {
					"mode",
				},
				lualine_b = {
					{ "branch", icon = "" },
				},
				lualine_c = {
					{
						"filename",
						symbols = {
							modified = " ",
							readonly = "󰌾 ",
							unnamed = "",
							newfile = "",
						},
					},
					{
						"diagnostics",
					},
				},
				lualine_x = {
					{
						"diff",
						symbols = { added = " ", modified = " ", removed = "󰛲 " },
					},
				},
				lualine_y = {
					{
						"filetype",
						-- icon = { align = "left" },
					},
				},
				lualine_z = {
          {
            "location",
            icon = ""
          }
				},
			},
		})
	end,
}
