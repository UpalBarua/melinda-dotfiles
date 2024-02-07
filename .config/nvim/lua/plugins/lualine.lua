return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        theme = "solarized_dark",
        section_separators = "",
        component_separators = "",
        ignore_focus = { "NvimTree" },
      },
      sections = {
        lualine_a = {},
        lualine_b = { "branch" },
        lualine_c = { "diagnostics" },
        lualine_x = { "copilot", "filetype" },
        lualine_y = { "progress" },
        lualine_z = {},
      },
    })
  end,
}
