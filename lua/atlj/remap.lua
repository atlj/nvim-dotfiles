vim.g.mapleader = ' '

local whichkey = require('which-key')
whichkey.register {
  ['<leader>'] = {
    w = { vim.cmd.write, 'Write file' },
    c = { function() require('bufdelete').bufdelete(0, true) end, 'Close file' },
    p = { vim.cmd.PackerSync, 'Sync Packer plugins' },
    e = { vim.cmd.NeoTreeShowToggle, 'Toggle the file explorer' },
    m = { vim.cmd.PixieCopy, 'Creates an image from the selected code' },
    q = {
      name = 'ChatGPT',
      c = { vim.cmd.ChatGPT, 'Chat' },
      e = { vim.cmd.ChatGPTEditWithInstructions, 'Edit' },
      p = { vim.cmd.ChatGPTCompleteCode, 'Complete code' }
    }
  },
  ['<S-l>'] = { vim.cmd.BufferLineCycleNext, 'Next tab' },
  ['<S-h>'] = { vim.cmd.BufferLineCyclePrev, 'Previous tab' },
  ['<C-g>'] = { function() vim.cmd('DiffviewOpen main...HEAD') end, 'Open Diffview against main branch' }
}

--- We need to make sure LSP bindings are loaded only if the LSP has attached
local lsp = require('lsp-zero')
lsp.on_attach(function(_, _)
  whichkey.register {
    ['<leader>'] = {
      d = { vim.diagnostic.open_float, 'LSP diagnostic' },
      a = { vim.lsp.buf.code_action, 'LSP code action' },
      r = { vim.lsp.buf.rename, 'Rename' },
    },
    K = { vim.lsp.buf.hover, 'Hover the code' }
  }

  vim.keymap.set('n', '<S- >', function() vim.lsp.buf.format { async = true } end)
  vim.keymap.set('i', '<S- >', function() vim.lsp.buf.format { async = true } end)
end)

local smartsplits = require('smart-splits')
vim.keymap.set({ 'n', 'i', 't' }, '<C-l>', smartsplits.move_cursor_right)
vim.keymap.set({ 'n', 'i', 't' }, '<C-h>', smartsplits.move_cursor_left)
vim.keymap.set({ 'n', 'i', 't' }, '<C-j>', smartsplits.move_cursor_down)
vim.keymap.set({ 'n', 'i', 't' }, '<C-k>', smartsplits.move_cursor_up)

--- ToggleTerm
vim.keymap.set({ 'n', 't' }, '<C-j>', vim.cmd.ToggleTerm)
local Terminal = require('toggleterm.terminal').Terminal
local lazyGit = Terminal:new({ cmd = 'lazygit', direction = 'float', hidden = true })
whichkey.register({
  ['<leader>g'] = { function() lazyGit:toggle() end, 'Open LazyGit' },
})

--- Telescope
local builtin = require('telescope.builtin')
whichkey.register {
  ['<leader>'] = {
    f = { builtin.find_files, 'Find files' },
    [';'] = { function() builtin.find_files { no_ignore = true } end, 'Find files (doesn\'t respect .gitignore)' },
    s = { builtin.live_grep, 'Find string' }
  },
  gd = { builtin.lsp_definitions, 'Go to definition(s)' },
  gr = { builtin.lsp_references, 'Go to reference(s)' }
}

--- GitSigns
local gitsigns = require('gitsigns')
whichkey.register {
  ['<leader>b'] = { gitsigns.blame_line, 'Git blame current line' }
}
