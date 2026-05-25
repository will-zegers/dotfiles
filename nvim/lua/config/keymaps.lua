-- Set mapleader before mappings
vim.g.mapleader = " "

local keymap = vim.keymap.set

-- Basic commands
keymap("n", "<leader>w", ":wa<CR>")
keymap("n", "<leader>q", ":q<CR>")
keymap("n", "<leader>t", ":tabnew<CR>")
keymap("n", "<leader>s", ":vsplit<CR>:w<CR>")
keymap("n", "<leader>i", ":split<CR>:w<CR>")
keymap("n", "<leader><", ":bprevious<CR>")
keymap("n", "<leader>>", ":bnext<CR>")
keymap("n", "<leader>d", ":bdel<CR>")
keymap("n", "<leader>.", ":set invnumber invrelativenumber<CR>")
keymap("n", "<leader>p", ":set invpaste paste?<CR>")

-- Keep cursor at same spot when appending lines
keymap("n", "J", "mzJ`z")

-- Move highlighted text up and down in visual mode
keymap("v", "J", ":m '>+1<cr>gv=gv")
keymap("v", "K", ":m '<-2<cr>gv=gv")

-- Swap role of ; and :
keymap("n", ":", ";")
keymap("n", ";", ":")
keymap("v", ":", ";")
keymap("v", ";", ":")

-- Clear search highlight
keymap("n", "<C-l>", ":noh<CR>")
