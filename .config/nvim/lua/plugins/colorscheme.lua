return {
  {
    "maxmx03/solarized.nvim",
    lazy = false,
    name = "solarized",
    priority = 1000,
    config = function()
      vim.o.background = "dark"
      vim.cmd.colorscheme("solarized")
      vim.cmd([[hi normal guibg=NONE ctermbg=NONE]])
    end,
  },
}
