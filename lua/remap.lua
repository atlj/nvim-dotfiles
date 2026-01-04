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
