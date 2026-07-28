return {
	"kdheepak/lazygit.nvim",
	enabled = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		vim.keymap.set("n", "<leader>gg", "<cmd>:LazyGit<CR>")
		vim.g.lazygit_floating_window_scaling_factor = 1.0
		vim.g.lazygit_floating_window_border_chars = { "┌", "─", "┐", "│", "┘", "─", "└", "│" } -- customize lazygit popup window border characters
	end,
}
