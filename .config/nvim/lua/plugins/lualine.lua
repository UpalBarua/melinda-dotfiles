return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "tokyonight-night",
        section_separators = "",
        component_separators = "",
      },
      sections = {
        lualine_a = {
          {
            "buffers",
            filetype_names = {
              TelescopePrompt = "Find",
              fzf = "Find",
              alpha = "Welcome",
            },
            use_mode_colors = true,
            symbols = {
              alternate_file = "",
            },
          },
        },
        lualine_b = {},
        lualine_c = {
          "diagnostics",
        },
        lualine_x = {
          {
            "diff",
            symbols = { added = " ", modified = " ", removed = "󰛲 " },
          },
        },
        lualine_y = {},
        lualine_z = { { "branch", icon = "" } },
      },
    })
  end,
}
