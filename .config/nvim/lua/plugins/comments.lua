return {
	"numToStr/Comment.nvim",
	dependencies = {
		{
			"JoosepAlviste/nvim-ts-context-commentstring",
			event = "VeryLazy",
		},
	},
	config = function()
		-- vim.g.skip_ts_context_commentstring_module = true  NOTE: Note sure what this line does, but it's been in my config for a long time.

		require("ts_context_commentstring").setup({
			enable_autocmd = false,
		})

		require("Comment").setup({
			ignore = "^$",
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
		})

		vim.keymap.set(
			"n",
			"<leader>/",
			"<Plug>(comment_toggle_linewise_current)<CR>",
			{ noremap = true, silent = true }
		)
		vim.keymap.set(
			"v",
			"<leader>/",
			"<Plug>(comment_toggle_linewise_visual)<CR>",
			{ noremap = true, silent = true }
		)
	end,
}
