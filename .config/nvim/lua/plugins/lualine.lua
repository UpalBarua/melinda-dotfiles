return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local custom_theme = require("lualine.themes.tokyonight-storm")
		local lualine_modes = { "insert", "normal", "visual", "command", "replace", "inactive", "terminal" }
		for _, field in ipairs(lualine_modes) do
			if custom_theme[field] and custom_theme[field].c then
				custom_theme[field].c.bg = "NONE"
			end
		end

		require("lualine").setup({
			options = {
				theme = custom_theme,
				section_separators = "",
				component_separators = "",
			},
			sections = {
				lualine_a = {
					{
						"buffers",
						filetype_names = {
							TelescopePrompt = "Find",
							fzf = "Find",
							alpha = "Welcome",
						},
						use_mode_colors = true,
						symbols = {
							alternate_file = "",
						},
					},
				},
				lualine_b = {},
				lualine_c = {
					"diagnostics",
				},
				lualine_x = {
					{
						"diff",
						symbols = { added = " ", modified = " ", removed = "󰛲 " },
					},
				},
				lualine_y = {},
				lualine_z = { { "branch", icon = "" } },
			},
		})
	end,
}
