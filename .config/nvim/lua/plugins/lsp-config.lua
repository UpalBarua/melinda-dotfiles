return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "williamboman/mason.nvim",
      version = "^1.0.0",
      lazy = false,
      config = function()
        require("mason").setup()
      end,
    },
    {
      "williamboman/mason-lspconfig.nvim",
      lazy = false,
      version = "^1.0.0",
      opts = {
        auto_install = true,
      },
    },
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lspconfig = require("lspconfig")

    local default_diagnostic_config = {
      virtual_text = false,
      update_in_insert = false,
      underline = true,
      severity_sort = true,
      float = {
        focusable = true,
        style = "minimal",
        border = "single",
        source = "always",
        header = "",
        prefix = "",
      },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN] = " ",
          [vim.diagnostic.severity.INFO] = "󰋼 ",
          [vim.diagnostic.severity.HINT] = "󰌵 ",
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

    -- local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
    -- for type, icon in pairs(signs) do
    --   local hl = "DiagnosticSign" .. type
    --   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    -- end

    local servers = {
      "lua_ls",
      "ts_ls",
      "tailwindcss",
      "html",
      "cssls",
      "emmet_language_server",
      "clangd",
      "pyright",
    }

    for _, server in pairs(servers) do
      lspconfig[server].setup({
        capabilities = capabilities,
      })
    end

    lspconfig.cssls.setup({
      capabilities = capabilities,
      settings = {
        css = {
          validate = true,
          lint = {
            unknownAtRules = "ignore",
          },
        },
        scss = {
          validate = true,
          lint = {
            unknownAtRules = "ignore",
          },
        },
      },
    })

    -- FOR JAVA
    require("java").setup()
    require("lspconfig").jdtls.setup({})

    local function organize_imports()
      local params = {
        command = "_typescript.organizeImports",
        arguments = { vim.api.nvim_buf_get_name(0) },
        title = "",
      }
      vim.lsp.buf.execute_command(params)
    end

    local opts = { noremap = true, silent = true }
    local keymap = vim.keymap.set
    keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    keymap("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    keymap("n", "<leader>li", "<cmd>LspInfo<CR>", opts)
    keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    keymap("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
    keymap("n", "<leader>lh", "<cmd>lua require('lua.lspconfig').toggle_inlay_hints()<CR>", opts)
    keymap("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
    keymap("n", "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<CR>", opts)
    keymap("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
    keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    keymap("n", "<leader>lo", organize_imports, opts)
    keymap(
      "n",
      "<leader>lf",
      "<cmd>lua vim.lsp.buf.format({async = true, filter = function(client) return client.name ~= 'typescript-tools' end})<cr>",
      opts
    )
  end,
}
