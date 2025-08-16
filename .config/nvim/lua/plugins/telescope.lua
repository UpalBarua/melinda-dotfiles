return {
	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-tree/nvim-web-devicons",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			local actions = require("telescope.actions")

			require("telescope").setup({
				defaults = {
					borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
					prompt_prefix = "   ",
					mappings = {
						i = {
							["<C-n>"] = actions.cycle_history_next,
							["<C-p>"] = actions.cycle_history_prev,

							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
						},
						n = {
							["<esc>"] = actions.close,
							["j"] = actions.move_selection_next,
							["k"] = actions.move_selection_previous,
							["q"] = actions.close,
						},
					},
				},
				pickers = {
					find_files = {
						file_ignore_patterns = { "node_modules", ".git", ".venv", "pnpm-lock.yaml" },
						hidden = true,
					},
				},
				live_grep = {
					file_ignore_patterns = { "node_modules", ".git", ".venv", "pnpm-lock.yaml" },
					additional_args = function(_)
						return { "--hidden" }
					end,
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})

			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("fzf")

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files)
			vim.keymap.set("n", "<leader>ft", builtin.live_grep)
			vim.keymap.set("n", "<leader>fw", builtin.grep_string)
			vim.keymap.set("n", "<leader>fh", builtin.help_tags)
			vim.keymap.set("n", "<leader>sk", builtin.keymaps)
			vim.keymap.set("n", "<leader>fl", builtin.resume)
			vim.keymap.set("n", "<leader>fr", builtin.oldfiles)
			vim.keymap.set("n", "<leader>fb", builtin.buffers)
			vim.keymap.set("n", "<leader>fd", builtin.diagnostics)
			vim.keymap.set("n", "<leader>fq", builtin.quickfix)
		end,
	},
}
