return {
	"numToStr/Comment.nvim",
  enabled = false,
	dependencies = {
		{
			"JoosepAlviste/nvim-ts-context-commentstring",
			event = "VeryLazy",
			opts = {
				enable_autocmd = false,
			},
		},
	},
	config = function()
		require("Comment").setup({
			ignore = "^$",
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
		})
	end,
	keys = {
		{
			"<leader>/",
			"<Plug>(comment_toggle_linewise_current)",
			mode = "n",
			desc = "Toggle comment (line)",
		},
		{
			"<leader>/",
			"<Plug>(comment_toggle_linewise_visual)",
			mode = "v",
			desc = "Toggle comment (visual)",
		},
	},
}
