return {
	{
		"echasnovski/mini.indentscope",
		event = "VeryLazy",
		version = false,
		opts = {
			symbol = "│",
			draw = {
				animation = function()
					return 0
				end,
			},
		},
	},
	{
		"nvim-mini/mini.diff",
		event = "VeryLazy",
		version = false,
		opts = {},
	},
	{
		"nvim-mini/mini.pairs",
		event = "VeryLazy",
		version = false,
		opts = {
			modes = { insert = true, command = true, terminal = false },
			skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
			skip_ts = { "string" },
			skip_unbalanced = true,
			markdown = true,
		},
	},
	{
		"nvim-mini/mini.ai",
		event = "VeryLazy",
		version = false,
		opts = {},
	},
	{ "nvim-mini/mini.surround", version = false, opts = {} },
	{
		"nvim-mini/mini.comment",
		version = false,
		dependencies = {
			{
				"JoosepAlviste/nvim-ts-context-commentstring",
				event = "VeryLazy",
				opts = {
					enable_autocmd = false,
				},
			},
		},
		opts = {
			custom_commentstring = function()
				return require("ts_context_commentstring").calculate_commentstring() or vim.bo.commentstring
			end,
		},
	},
	{
		"nvim-mini/mini.files",
		version = false,
		opts = {},
		keys = {
			{
				"-",
				function()
					if MiniFiles.close() == nil then
						MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
					end
				end,
				mode = "n",
				{ desc = "Open parent directory" },
			},
		},
	},
  { 'nvim-mini/mini.icons', version = false, opts = {} },
}
