-- turn line numbering on
vim.opt.number = true
vim.opt.relativenumber = true

-- youtube conf
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- for undo tree to load past changes
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
-- vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

-- use spaces for tabs and whatnot
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- vim.opt.colorcolumn = "80"
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
-- to see hidden elements
vim.opt.list = true
vim.o.wrap = false
vim.opt.listchars:append("extends:↩")
