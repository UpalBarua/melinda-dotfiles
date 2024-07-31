return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- require("catppuccin").setup({
      -- transparent_background = false,
      -- })

      vim.o.background = "dark"
      vim.cmd([[colorscheme tokyonight-night]])

      -- vim.cmd([[hi normal guibg=NONE ctermbg=NONE]])
      -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      -- vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
    end,
  },
}
