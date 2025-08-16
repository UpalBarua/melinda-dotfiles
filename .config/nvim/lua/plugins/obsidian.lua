return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  event = {
    "BufReadPre " .. vim.fn.expand("~") .. "/.obsidian-vault/*.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    vim.opt.conceallevel = 1

    require("obsidian").setup({
      workspaces = {
        {
          name = "notes",
          path = "~/.obsidian-vault",
        },
      },
    })
  end,
}
