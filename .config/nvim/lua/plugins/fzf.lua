return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	---@module "fzf-lua"
	---@type fzf-lua.Config|{}
	---@diagnostic disable: missing-fields
	opts = {},
	keys = {
		-- Files & Buffers
		{
			"<leader><leader>",
			function()
				FzfLua.files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>fb",
			function()
				FzfLua.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>ft",
			function()
				FzfLua.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>fl",
			function()
				FzfLua.oldfiles()
			end,
			desc = "Recent",
		},

		-- Git
		{
			"<leader>gb",
			function()
				FzfLua.git_branches()
			end,
			desc = "Git Branches",
		},
		{
			"<leader>gl",
			function()
				FzfLua.git_commits()
			end,
			desc = "Git Log",
		},
		{
			"<leader>gs",
			function()
				FzfLua.git_status()
			end,
			desc = "Git Status",
		},
		{
			"<leader>gd",
			function()
				FzfLua.git_diff()
			end,
			desc = "Git Diff (Hunks)",
		},
		{
			"<leader>gf",
			function()
				FzfLua.git_bcommits()
			end,
			desc = "Git Log File",
		},

		-- Search
		{
			"<leader>sb",
			function()
				FzfLua.lines()
			end,
			desc = "Buffer Lines",
		},
		{
			"<leader>sB",
			function()
				FzfLua.grep_buffers()
			end,
			desc = "Grep Open Buffers",
		},
		{
			"<leader>fw",
			function()
				FzfLua.grep_visual()
			end,
			desc = "Visual selection or word",
			mode = { "n", "x" },
		},

		-- Diagnostics & LSP
		{
			"<leader>fD",
			function()
				FzfLua.diagnostics_workspace()
			end,
			desc = "Diagnostics",
		},
		{
			"<leader>fd",
			function()
				FzfLua.diagnostics_document()
			end,
			desc = "Buffer Diagnostics",
		},
		{
			"<leader>fs",
			function()
				FzfLua.lsp_workspace_symbols()
			end,
			desc = "LSP Symbols",
		},

		-- Help & Navigation
		{
			"<leader>fh",
			function()
				FzfLua.helptags()
			end,
			desc = "Help Pages",
		},
		{
			"<leader>fj",
			function()
				FzfLua.jumps()
			end,
			desc = "Jumps",
		},
		{
			"<leader>fk",
			function()
				FzfLua.keymaps()
			end,
			desc = "Keymaps",
		},
		{
			"<leader>fm",
			function()
				FzfLua.manpages()
			end,
			desc = "Man Pages",
		},
		{
			"<leader>fu",
			function()
				FzfLua.undotree()
			end,
			desc = "Undo History",
		},
		{
			"<leader>fr",
			function()
				FzfLua.resume()
			end,
			desc = "Resume",
		},
	},
	---@diagnostic enable: missing-fields
}
