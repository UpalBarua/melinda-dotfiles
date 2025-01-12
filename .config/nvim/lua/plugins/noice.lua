return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    {
      "rcarriga/nvim-notify",
      config = function()
        require("notify").setup({
          render = "minimal",
          stages = "static",
          on_open = function(win)
            local config = vim.api.nvim_win_get_config(win)
            config.border = "single"
            vim.api.nvim_win_set_config(win, config)
          end,
        })
      end,
    },
  },
  config = function()
    require("noice").setup({
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "fewer lines" },
            },
          },
          view = "mini",
        },
      },
      presets = {
        bottom_search = false,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = true,
      },
      views = {
        cmdline_popup = {
          position = {
            row = 5,
            col = "50%",
          },
          border = {
            style = "single",
          },
          size = {
            min_width = 60,
            width = "auto",
            height = "auto",
          },
          win_options = {
            winhighlight = { NormalFloat = "NormalFloat", FloatBorder = "FloatBorder" },
          },
        },
        cmdline_popupmenu = {
          relative = "editor",
          position = {
            row = 13,
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
            max_height = 15,
          },
          border = {
            style = "single",
            padding = { 0, 3 },
          },
          win_options = {
            winhighlight = { NormalFloat = "NormalFloat", FloatBorder = "NoiceCmdlinePopupBorder" },
          },
        },
        hover = {
          border = {
            style = "single",
          },
        },
        confirm = {
          border = {
            style = "single",
          },
        },
        popup = {
          border = {
            style = "single",
          },
        },
      },
    })
  end,
}
