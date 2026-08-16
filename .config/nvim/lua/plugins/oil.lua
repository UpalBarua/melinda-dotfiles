return {
	"stevearc/oil.nvim",
  enabled = false,
	---@module 'oil'
	---@type oil.SetupOpts
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		default_file_explorer = true,
		delete_to_trash = true,
		skip_confirm_for_simple_edits = true,
		view_options = {
			show_hidden = true,
			natural_order = true,
			is_always_hidden = function(name, _)
				return name == ".." or name == ".git" or name == "node_modules"
			end,
		},
		win_options = {
			wrap = true,
			winblend = 0,
		},
		keymaps = {
			["<C-c>"] = false,
			["q"] = "actions.close",
		},
		float = {
			border = "rounded",
			max_height = 20,
			max_width = 60,
		},
	},
	keys = {
		{
			"-",
			"<CMD>Oil --float<CR>",
			mode = "n",
			{ desc = "Open parent directory" },
		},
		{
			"<leader>e",
			"<CMD>Oil --float<CR>",
			mode = "n",
			{ desc = "Open parent directory" },
		},
	},
}
