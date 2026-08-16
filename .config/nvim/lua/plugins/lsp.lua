return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local server_configs = {
				lua_ls = {
					settings = {
						Lua = {
							runtime = { version = "LuaJIT" },
							diagnostics = { globals = { "vim" } },
							workspace = { library = vim.api.nvim_get_runtime_file("", true) },
							telemetry = { enable = false },
						},
					},
				},
				-- ts_ls = {},
				-- vtsls = {},
				tailwindcss = {
					settings = {
						tailwindCSS = {
							experimental = {
								classRegex = {
									{ "tva\\((([^()]*|\\([^()]*\\))*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
								},
							},
						},
						classAttributes = {
							"class",
							"className",
							"headerClassName",
							"contentContainerClassName",
							"columnWrapperClassName",
							"endFillColorClassName",
							"imageClassName",
							"tintColorClassName",
							"ios_backgroundColorClassName",
							"thumbColorClassName",
							"trackColorOnClassName",
							"trackColorOffClassName",
							"selectionColorClassName",
							"cursorColorClassName",
							"underlineColorAndroidClassName",
							"placeholderTextColorClassName",
							"selectionHandleColorClassName",
							"colorsClassName",
							"progressBackgroundColorClassName",
							"titleColorClassName",
							"underlayColorClassName",
							"colorClassName",
							"drawerBackgroundColorClassName",
							"statusBarBackgroundColorClassName",
							"backdropColorClassName",
							"backgroundColorClassName",
							"ListFooterComponentClassName",
							"ListHeaderComponentClassName",
						},
						classFunctions = { "useResolveClassNames" },
					},
				},
				html = {},
				emmet_language_server = {
					settings = {
						filetypes = {
							"html",
							"css",
							"javascript",
							"javascriptreact",
							"typescriptreact",
							"vue",
							"svelte",
						},
					},
				},
				clangd = {},
				nil_ls = {},
				basedpyright = {},
				cssls = {
					settings = {
						css = { validate = true, lint = { unknownAtRules = "ignore" } },
						scss = { validate = true, lint = { unknownAtRules = "ignore" } },
					},
				},
				hyprls = {},
				bashls = {},
			}

			for server, config in pairs(server_configs) do
				vim.lsp.config(server, config)
			end

			vim.lsp.enable(vim.tbl_keys(server_configs))

			local default_diagnostic_config = {
				virtual_text = false,
				update_in_insert = false,
				underline = true,
				severity_sort = true,
				float = {
					focusable = true,
					style = "minimal",
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "󰅚 ",
						[vim.diagnostic.severity.WARN] = "󰀪 ",
						[vim.diagnostic.severity.INFO] = " ",
						[vim.diagnostic.severity.HINT] = "󰌶 ",
					},
					numhl = {
						[vim.diagnostic.severity.ERROR] = "",
						[vim.diagnostic.severity.WARN] = "",
						[vim.diagnostic.severity.HINT] = "",
						[vim.diagnostic.severity.INFO] = "",
					},
				},
			}

			vim.diagnostic.config(default_diagnostic_config)

			-- local function organize_imports()
			-- 	local params = {
			-- 		command = "_typescript.organizeImports",
			-- 		arguments = { vim.api.nvim_buf_get_name(0) },
			-- 		title = "",
			-- 	}

			-- 	local clients = vim.lsp.get_clients({ name = "vtsls" })

			-- 	if #clients == 0 then
			-- 		vim.notify("No ts client found", vim.log.levels.ERROR)
			-- 		return
			-- 	end

			-- 	local client = clients[1]
			-- 	client:exec_cmd(params)
			-- 	vim.notify("Imports sorted", vim.log.levels.INFO)
			-- end

			local keymap = vim.keymap.set
			local opts = { noremap = true, silent = true }

			keymap("n", "K", vim.lsp.buf.hover, opts)
			keymap("n", "gl", vim.diagnostic.open_float, opts)
			keymap("n", "gk", vim.lsp.buf.signature_help, opts)
			keymap("n", "<leader>cr", vim.lsp.buf.rename, opts)
			-- keymap("n", "<leader>co", organize_imports, opts)
			keymap("i", "<c-k>", vim.lsp.buf.signature_help, opts)
			keymap({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, opts)
			keymap({ "n", "x" }, "<leader>cc", vim.lsp.codelens.run, opts)
		end,
	},
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("typescript-tools").setup({})
			vim.keymap.set("n", "<leader>co", "<cmd>TSToolsOrganizeImports<cr>", { noremap = true, silent = true })
		end,
	},
}
