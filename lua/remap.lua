-- Rebind the keys
-- :h lua-guide-mappings

-- Set the leader key to space
vim.g.mapleader = ' '

local wk = require('which-key')

-- Windows

wk.add {
  { '<C-l>', '<C-w>l', desc = "Jump to the Right Window"},
  { '<C-h>', '<C-w>h', desc = "Jump to the Left Window"},
}

-- Files

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

-- LSP
wk.add {
  {
    '<leader>l',
    function()
      vim.lsp.buf.code_action {
        apply = true,
        context = {
          only = { 'quickfix' }
        },
        filter = function(action)
          local title = action.title:lower()
          return title:find('import') ~= nil
        end
      }
    end,
    desc = "Import the Symbol Under Cursor"
  },
  { '<leader>d', vim.diagnostic.open_float, desc = 'Show LSP Diagnostics'},
  { '<leader>a', vim.lsp.buf.code_action, desc = 'Show Code Actions'},
  { '<leader>r', vim.lsp.buf.rename, desc = 'Show Code Actions'},
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

-- Harpoon

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

-- DiffView
wk.add {
  { '<leader>m', vim.cmd.DiffviewOpen, desc = "Show the Current Git Diff" },
  { '<C-g>', function() vim.cmd.DiffviewOpen('main...HEAD') end, desc = "Show the Current Git Diff" },
}
