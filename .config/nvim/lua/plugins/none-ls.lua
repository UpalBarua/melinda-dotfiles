return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.black,
        null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.diagnostics.ruff,
        require("none-ls.diagnostics.eslint_d").with({
          condition = function(utils)
            return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs" })
          end,
        }),
      },
    })

    vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, {})
  end,
}
