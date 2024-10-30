return {
	"numToStr/Comment.nvim",
	dependencies = {
		{
			"JoosepAlviste/nvim-ts-context-commentstring",
			event = "VeryLazy",
		},
	},
	config = function()
		local keymap = vim.keymap.set
		local opts = { noremap = true, silent = true }

		keymap("n", "<leader>/", "<Plug>(comment_toggle_linewise_current)<CR>", opts)
		keymap("v", "<leader>/", "<Plug>(comment_toggle_linewise_visual)<CR>", opts)

		vim.g.skip_ts_context_commentstring_module = true
		require("ts_context_commentstring").setup({
			enable_autocmd = false,
		})

		require("Comment").setup({
			ignore = "^$",
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
		})
	end,
}
