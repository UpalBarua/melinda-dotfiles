return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      {
        "folke/neodev.nvim",
      },
    },
    config = function()
      local opts = { noremap = true, silent = true }
      local keymap = vim.keymap.set

      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      local default_diagnostic_config = {
        virtual_text = true,
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
      }

      vim.diagnostic.config(default_diagnostic_config)

      local servers = {
        "lua_ls",
        "tsserver",
        "tailwindcss",
        "html",
        "emmet_language_server",
      }

      for _, server in pairs(servers) do
        lspconfig[server].setup({
          capabilities = capabilities,
        })
      end

      local function organize_imports()
        local params = {
          command = "_typescript.organizeImports",
          arguments = { vim.api.nvim_buf_get_name(0) },
          title = "",
        }
        vim.lsp.buf.execute_command(params)
      end

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
  },
}
