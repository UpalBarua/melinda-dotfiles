return {
	"rcarriga/nvim-notify",
  enabled = false,
	opts = {
		render = "default",
		stages = "fade",
		on_open = function(win)
			local config = vim.api.nvim_win_get_config(win)
			vim.api.nvim_win_set_config(win, config)
		end,
	},
}
