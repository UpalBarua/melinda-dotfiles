return {
  "goolord/alpha-nvim",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      "▄• ▄▌ ▄▄▄· ▄▄▄· ▄▄▌      ▄▄▄▄·  ▄▄▄· ▄▄▄  ▄• ▄▌ ▄▄▄· ",
      "█▪██▌▐█ ▄█▐█ ▀█ ██•      ▐█ ▀█▪▐█ ▀█ ▀▄ █·█▪██▌▐█ ▀█ ",
      "█▌▐█▌ ██▀·▄█▀▀█ ██▪      ▐█▀▀█▄▄█▀▀█ ▐▀▀▄ █▌▐█▌▄█▀▀█ ",
      "▐█▄█▌▐█▪·•▐█ ▪▐▌▐█▌▐▌    ██▄▪▐█▐█ ▪▐▌▐█•█▌▐█▄█▌▐█ ▪▐▌",
      " ▀▀▀ .▀    ▀  ▀ .▀▀▀     ·▀▀▀▀  ▀  ▀ .▀  ▀ ▀▀▀  ▀  ▀ ",
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("SPC e", "  File tree"),
      dashboard.button("SPC f f", "  Find file"),
      dashboard.button("SPC f r", "󰈢  Recent files"),
      dashboard.button("SPC gg", "  Git repo"),
      dashboard.button("n", "  New file", "<Cmd>ene<CR>"),
      dashboard.button("q", "󰅚  Quit", "<Cmd>qa<CR>"),
    }

    -- local fortune = require("alpha.fortune")
    -- dashboard.section.footer.val = fortune()

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[
      autocmd FileType alpha setlocal nofoldenable
    ]])
  end,
}
