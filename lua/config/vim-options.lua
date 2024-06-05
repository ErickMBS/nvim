vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set cursorline")
vim.cmd("set clipboard=unnamedplus")
vim.cmd("set completeopt=noinsert,menuone,noselect")
vim.cmd("set mouse=a")
--vim.cmd("set relativenumber")
vim.cmd("set splitbelow splitright")
vim.cmd("set title")
vim.cmd("set ttimeoutlen=0")
vim.cmd("set hidden")

vim.g.mapleader = " "
vim.g.background = "light"
-- caminho do python 3
vim.g.python3_host_prog = '/usr/bin/python3'

vim.opt.swapfile = false
vim.opt.clipboard = "unnamedplus"

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.wo.number = true
