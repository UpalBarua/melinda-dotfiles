return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }

    keymap("n", "<leader>gg", ":Neogit<CR>", opts)
    keymap("n", "<leader>gc", ":Neogit commit<CR>", opts)
    keymap("n", "<leader>gp", ":Neogit pull<CR>", opts)
    keymap("n", "<leader>gP", ":Neogit push<CR>", opts)
  end,
}
