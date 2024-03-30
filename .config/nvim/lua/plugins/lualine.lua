return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        theme = "tokyonight",
        section_separators = "",
        component_separators = "",
        ignore_focus = { "NvimTree" },
      },
      sections = {
        lualine_a = { "branch" },
        lualine_b = { "buffers" },
        lualine_c = {},
        lualine_x = { "diagnostics" },
        lualine_y = { "location" },
        lualine_z = { "filetype" },
      },
    })
  end,
}
