return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lua",
		"saadparwaiz1/cmp_luasnip",
		"L3MON4D3/LuaSnip",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		local icons = {
			Text = "󰉿",
			Method = "m",
			Function = "󰊕",
			Constructor = "",
			Field = "",
			Variable = "󰆧",
			Class = "󰌗",
			Interface = "",
			Module = "",
			Property = "",
			Unit = "",
			Value = "󰎠",
			Enum = "",
			Keyword = "󰌋",
			Snippet = "",
			Color = "󰏘",
			File = "󰈙",
			Reference = "",
			Folder = "󰉋",
			EnumMember = "",
			Constant = "󰇽",
			Struct = "",
			Event = "",
			Operator = "󰆕",
			TypeParameter = "󰊄",
		}

		require("luasnip.loaders.from_vscode").load_standalone({
			path = "~/.config/nvim/snippets/global-snippets.code-snippets",
		})

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			window = {
				completion = {
					border = "single",
					scrollbar = false,
					winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
				},
				documentation = {
					border = "single",
					winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
				},
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-5),
				["<C-f>"] = cmp.mapping.scroll_docs(5),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp", priority = 10 },
				{ name = "luasnip", priority = 8 },
				{ name = "nvim_lua", priority = 7 },
				{ name = "buffer", priority = 5, keyword_length = 3 },
				{ name = "path", priority = 3 },
			}),
			confirm_opts = {
				behavior = cmp.ConfirmBehavior.Replace,
				select = false,
			},
			experimental = {
				ghost_text = true,
				hl_group = "Comment", -- NOTE: AI Suggested
			},
			formatting = {
				fields = { "icon", "abbr", "kind" },
				format = function(entry, vim_item)
          vim_item.icon = string.format("%s", icons[vim_item.kind])
					vim_item.kind = string.format("%s", vim_item.kind)

					-- vim_item.menu = ({
					-- 	nvim_lsp = "[LSP]",
					-- 	luasnip = "[SNIP]",
					-- 	buffer = "[BUF]",
					-- 	path = "[PATH]",
					-- 	nvim_lua = "[LUA]",
					-- })[entry.source.name]

					local max_width = 80

					if #vim_item.abbr > max_width then
						vim_item.abbr = string.sub(vim_item.abbr, 1, max_width - 3) .. "..."
					end

					return vim_item
				end,
			},
			performance = { -- NOTE: Adds throttle
				debounce = 150,
				throttle = 60,
				max_view_entries = 10,
			},
		})

		-- `/` cmdline setup.
		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		-- `:` cmdline setup.
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{
					name = "cmdline",
					option = {
						ignore_cmds = { "Man", "!" },
					},
				},
			}),
		})
	end,
}
