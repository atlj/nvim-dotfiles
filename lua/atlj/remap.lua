vim.g.mapleader = ' '

local whichkey = require('which-key')
whichkey.register {
  ['<leader>'] = {
    w = { vim.cmd.write, 'Write file' },
    c = { function() require('bufdelete').bufdelete(0, true) end, 'Close file' },
    e = {
      ---@diagnostic disable-next-line: undefined-global
      function()
        MiniFiles.open(
          vim.api.nvim_buf_get_name(0)
        )
      end,
      'Toggle the file explorer' },
    x = {
      function()
        if (#vim.api.nvim_list_tabpages() > 1) then
          vim.cmd.tabclose()
        else
          vim.cmd.xa()
        end
      end,
      'Close tab or Neovim'
    },
    m = {
      function() vim.cmd("DiffviewOpen") end, "Open the merge tool",
    },
    l = {
      function()
        vim.lsp.buf.code_action {
          apply = true,
          context = {
            only = { 'quickfix' }
          },
          filter = function(action)
            local title = action.title:lower()
            return title:find('import')
          end
        }
      end,
      "Import the symbol under the cursor"
    }
  },
  ['<C-g>'] = { function() vim.cmd('DiffviewOpen dev...HEAD') end, 'Open Diffview against dev branch' }
}

--- We need to make sure LSP bindings are loaded only if the LSP has attached
local lsp = require('lsp-zero')
local function formatAsync()
  vim.lsp.buf.format { async = true }
end
lsp.on_attach(function(_, _)
  whichkey.register {
    ['<leader>'] = {
      d = { vim.diagnostic.open_float, 'LSP diagnostic' },
      a = { vim.lsp.buf.code_action, 'LSP code action' },
      r = { vim.lsp.buf.rename, 'Rename' },
    },
    K = { vim.lsp.buf.hover, 'Hover the code' }
  }

  vim.keymap.set('n', '<S- >', formatAsync)
  vim.keymap.set('i', '<S- >', formatAsync)
end)

vim.keymap.set({ 'n', 'i', 't' }, '<C-l>', '<C-w>l')
vim.keymap.set({ 'n', 'i', 't' }, '<C-h>', '<C-w>h')

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
    s = { builtin.live_grep, 'Find string' },
    G = { builtin.git_bcommits, 'Find git commits in current buffer' }
  },
  gd = { builtin.lsp_definitions, 'Go to definition(s)' },
  gr = { builtin.lsp_references, 'Go to reference(s)' }
}

-- Spectre

local spectre = require('spectre')
whichkey.register {
  ['<leader>'] = {
    S = {
      spectre.toggle,
      'Toggle Spectre'
    }
  }
}

--- Harpoon
local harpoon = require("harpoon")

whichkey.register {
  ['<leader>'] = {
    k = { function() harpoon:list():add() end, 'Add a new harpoon' },
    h = { function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, 'Toggle the harpoon menu' },
  },
}

vim.keymap.set("n", "<S-h>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<S-l>", function() harpoon:list():next() end)

vim.keymap.set("n", "<C-s>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-f>", function() harpoon:list():select(harpoon:list():length()) end)

--- GitSigns
local gitsigns = require('gitsigns')
whichkey.register {
  ['<leader>b'] = { gitsigns.blame_line, 'Git blame current line' }
}
