return {
	"windwp/nvim-autopairs",
	enabled = false,
  event = "InsertEnter",
  config = function()
		require("nvim-autopairs").setup({
			check_ts = true,
			disable_filetype = { "TelescopePrompt", "spectre_panel" },
		})

		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp = require("cmp")

		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
