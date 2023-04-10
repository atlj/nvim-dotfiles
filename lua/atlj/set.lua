-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Tab stops
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Indentatin
vim.opt.smartindent = true
vim.opt.preserveindent = true

-- Undo
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8

-- Share the clipboard between system and nvim
vim.opt.clipboard = 'unnamedplus'

-- Hide the command line
vim.opt.cmdheight = 0
vim.opt.termguicolors = true

-- Append diagonal lines on diff mode
vim.opt.fillchars:append { diff = '╱' }
