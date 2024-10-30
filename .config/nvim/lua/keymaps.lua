local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Set leader key
keymap({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Save or Quit
keymap("n", "<leader>w", "<cmd>:update<cr>", opts)
keymap("n", "<leader>q", "<cmd>:q!<cr>", opts)
keymap("n", "<C-s>", "<cmd>:update<cr>", opts)
keymap("n", "<C-q>", "<cmd>:q!<cr>", opts)

-- Move Lines
keymap("n", "<A-j>", "<cmd>m .+1<cr>==", opts)
keymap("n", "<A-k>", "<cmd>m .-2<cr>==", opts)
keymap("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", opts)
keymap("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", opts)
keymap("v", "<A-j>", ":m '>+1<cr>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<cr>gv=gv", opts)

-- Stay in center
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- delete without yanking
keymap("n", "x", '"_x', opts)
keymap("x", "p", [["_dP]], opts)

keymap("n", "<leader>+", "<C-a>", opts)
keymap("n", "<leader>-", "<C-x>", opts)

-- Split  management
keymap("n", "<leader>v", "<C-w>v", opts)
keymap("n", "<leader>h", "<C-w>s", opts)
keymap("n", "<leader>se", "<C-w>=", opts)
keymap("n", "<leader>xs", ":close<CR>", opts)

-- Navigate between splits
keymap("n", "<C-j>", ":wincmd j<CR>", opts)
keymap("n", "<C-h>", ":wincmd h<CR>", opts)
keymap("n", "<C-k>", ":wincmd k<CR>", opts)
keymap("n", "<C-l>", ":wincmd l<CR>", opts)

-- Buffers
keymap("n", "<S-h>", "<cmd>bprevious<cr>", opts)
keymap("n", "<S-l>", "<cmd>bnext<cr>", opts)
keymap("n", "<leader>bd", "<cmd>bdelete<cr>", opts)
keymap("n", "<leader>bD", "<cmd>:%bd|e#|bd#<cr>", opts)

-- tailwindcss
keymap({ "n", "x" }, "j", "gj", opts)
keymap({ "n", "x" }, "k", "gk", opts)

-- Clear search with <esc>
keymap({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", opts)

-- Toggle line wrapping
keymap("n", "<leader>lw", "<cmd>set wrap!<CR>", opts)

-- Misc
keymap("n", "<leader>L", "<cmd>:Lazy<cr>", opts)
keymap("n", "<leader>M", "<cmd>:Mason<cr>", opts)

-- keymap("n", "<C-i>", "<C-i>", opts)
