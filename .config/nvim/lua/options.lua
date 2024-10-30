vim.g.netrw_banner = 0
vim.g.netrw_mouse = 2
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 1
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.conceallevel = 0
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.mouse = "a"
vim.opt.pumheight = 10
vim.opt.pumblend = 10
vim.opt.showmode = false
vim.opt.showtabline = 1
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.o.autoindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.timeoutlen = 1000
vim.opt.undofile = true
vim.opt.updatetime = 100
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.laststatus = 3
vim.opt.showcmd = false
vim.opt.ruler = false
vim.opt.relativenumber = true
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8
vim.opt.guifont = "monospace:h17"
vim.opt.title = false
vim.opt.colorcolumn = "80"
vim.opt.shortmess:append("c")
vim.opt.iskeyword:append("-")
vim.opt.wrap = false
vim.opt.wrapmargin = 0
vim.o.whichwrap = "bs<>[]hl"
vim.opt.linebreak = true
vim.opt.textwidth = 0
vim.o.backspace = "indent,eol,start"
vim.opt.formatoptions:remove({ "c", "r", "o" })
vim.opt.fillchars = vim.opt.fillchars + "eob: "
vim.opt.fillchars:append({
  stl = " ",
})
