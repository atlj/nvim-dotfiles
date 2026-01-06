-- Rebind the keys
-- :h lua-guide-mappings

-- Set the leader key to space
vim.g.mapleader = ' '

local wk = require('which-key')

wk.add {
  { '<leader>w', vim.cmd.write, desc = 'Save File' },
  { '<leader>e', function() MiniFiles.open(vim.api.nvim_buf_get_name(0)) end, desc = 'Show File Picker'},
  {
    '<leader>x',
    function()
      if (#vim.api.nvim_list_tabpages() > 1) then
        vim.cmd.tabclose()
      else
        vim.cmd.xa()
      end
    end,
    desc = 'Close Tab'
  },
}

-- fzf-lua

local fzf = require('fzf-lua')
wk.add {
  { '<leader>f', fzf.files, desc = 'Find Files' },
  { '<leader>s', fzf.live_grep, desc = 'Find String' },
  { '<leader>G', fzf.git_bcommits, desc = 'Find Git Commits' },
  { 'gd', fzf.lsp_definitions, desc = 'Go to Definition(s)' },
  { 'gr', fzf.lsp_references, desc = 'Go to Reference(s)' },
}

-- lazygit

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = 'lazygit', hidden = true, direction = 'float' })

wk.add {
  { '<leader>g', function() lazygit:toggle() end, desc = "Toggle Lazygit" }
}

-- gitsigns

local gitsigns = require('gitsigns')
wk.add {
  { '<leader>b', gitsigns.blame_line, desc = "Git blame current line" }
}

--- Harpoon

local harpoon = require("harpoon")

wk.add {
  { '<leader>k', function() harpoon:list():add() end, desc = "Harpoon the File"},
  { '<leader>h', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Toggle the Harpoon Menu"},
  {
    mode = "n",
    { "<S-h>", function() harpoon:list():prev() end, desc = "Previous Harpooned File"},
    { "<S-l>", function() harpoon:list():prev() end, desc = "Next Harpooned File"},
    { "<C-s>", function() harpoon:list():prev() end, desc = "First Harpooned File"},
    { "<C-f>", function() harpoon:list():prev() end, desc = "Last Harpooned File"},
  }
}
