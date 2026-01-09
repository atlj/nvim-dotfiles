-- Set the options
-- :h lua-guide-options

-- Show the current line number
vim.opt.number = true
-- Enable relative numbers
vim.opt.relativenumber = true

-- Displays tabs as 2 spaces
vim.opt.tabstop = 2
-- How much spaces to use when user indents
vim.opt.shiftwidth = 2
-- Use spaces instead of tabs
vim.opt.expandtab = true

-- New line automatically appends the indent
vim.opt.smartindent = true
-- Preserve indent as much as possible when you change indenting
vim.opt.preserveindent = true

-- Don't create a backup file
vim.opt.backup = false
-- Save all changes in a file so you can easily undo
vim.opt.undofile = true

-- Don't highlight search
vim.opt.hlsearch = false
-- Highlight the next search match as you type
vim.opt.incsearch = true

-- Keep 8 lines on the screen when you scroll
vim.opt.scrolloff = 8

-- Sync the system clipboard with yank buffer
vim.opt.clipboard = 'unnamedplus'

-- Don't show the last command
vim.opt.cmdheight = 0

-- 24-bit RGB colors
vim.opt.termguicolors = true

-- Never display error messages
vim.o.messagesopt = 'wait:0,history:500'

-- Display whitespaces
vim.opt.list = true
vim.opt.listchars:append { eol = '¬', trail = '·' }

-- Always display the sign column. Prevents jumping
vim.opt.signcolumn = 'yes'

-- Display the autocomplete menu
vim.opt.completeopt = { 'menuone', 'popup', 'noinsert', 'noselect', 'fuzzy' }
-- The filetype specific (omni) menu should be the default, and we should display the local buffer autocomplete
vim.opt.complete = { 'o', '.' }

-- Set the colorscheme
vim.cmd.colorscheme('melange')
