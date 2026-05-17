return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    -- "WhoIsSethDaniel/mason-tool-installer.nvim",
    "hrsh7th/cmp-nvim-lsp",
    {
      "mason-org/mason.nvim",
      lazy = false,
      config = function()
        require("mason").setup()
      end,
    },
    -- {
    --   "mason-org/mason-lspconfig.nvim",
    --   lazy = false,
    -- },
  },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local server_configs = {
      lua_ls = {
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
            telemetry = { enable = false },
          },
        },
      },
      ts_ls = { capabilities = capabilities },
      tailwindcss = { capabilities = capabilities },
      html = { capabilities = capabilities },
      emmet_language_server = {
        capabilities = capabilities,
        settings = {
          filetypes = { "html", "css", "javascript", "javascriptreact", "typescriptreact", "vue", "svelte" },
        },
      },
      clangd = { capabilities = capabilities },
      basedpyright = { capabilities = capabilities },
      cssls = {
        capabilities = capabilities,
        settings = {
          css = { validate = true, lint = { unknownAtRules = "ignore" } },
          scss = { validate = true, lint = { unknownAtRules = "ignore" } },
        },
      },
    }

    -- require("mason-lspconfig").setup({
    --   ensure_installed = vim.tbl_keys(server_configs), -- NOTE: not sure about this thing
    -- })

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

    local function organize_imports()
      local params = {
        command = "_typescript.organizeImports",
        arguments = { vim.api.nvim_buf_get_name(0) },
        title = "",
      }

      local clients = vim.lsp.get_clients({ name = "ts_ls" })
      if #clients == 0 then
        vim.notify("No ts_ls client found", vim.log.levels.ERROR)
        return
      end
      local client = clients[1]
      client:exec_cmd(params)
      vim.notify("Imports sorted", vim.log.levels.INFO)
    end

    local opts = { noremap = true, silent = true }
    local keymap = vim.keymap.set

    keymap("n", "gD", vim.lsp.buf.declaration, opts)
    keymap("n", "gd", vim.lsp.buf.definition, opts)
    keymap("n", "K", vim.lsp.buf.hover, opts)
    keymap("n", "gI", vim.lsp.buf.implementation, opts)
    keymap("n", "gr", vim.lsp.buf.references, opts)
    keymap("n", "gl", vim.diagnostic.open_float, opts)
    keymap("n", "<leader>la", vim.lsp.buf.code_action, opts)
    keymap("n", "<leader>lj", vim.diagnostic.goto_next, opts)
    keymap("n", "<leader>lk", vim.diagnostic.goto_prev, opts)
    keymap("n", "<leader>ll", vim.lsp.codelens.run, opts)
    keymap("n", "<leader>lq", vim.diagnostic.setloclist, opts)
    keymap("n", "<leader>lr", vim.lsp.buf.rename, opts)
    keymap("n", "<leader>lo", organize_imports, opts)
  end,
}
