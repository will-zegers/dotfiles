-- Import key mappings
-- require("keymap")

-- Options
vim.opt.cursorline = true
vim.opt.encoding = "utf-8"
vim.opt.expandtab = true
vim.opt.hidden = true
vim.opt.history = 200
vim.opt.hlsearch = true
vim.opt.list = true
vim.opt.wrap = false
vim.opt.nrformats:remove("octal")
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.smartcase = true
vim.opt.tabstop = 2
vim.opt.undofile = false

-- For zsh autocomplete behavior
vim.opt.wildmenu = true
vim.opt.wildmode = "full"

-- List characters (trailing whitespace and tabs)
vim.opt.listchars = { tab = "»»", trail = "·", nbsp = "~" }

-- Path: include the initial cwd in the search path
vim.opt.path:append("%:h/**")

-- UI enhancement: ColorColumn at 101st character
vim.fn.matchadd('ColorColumn', [[\%101v]], 100)
