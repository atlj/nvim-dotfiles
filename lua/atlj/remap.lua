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
    },
    p = {
      vim.diagnostic.setloclist,
      "Show the problems"
    },
    q = {
      function() vim.cmd('lbel') end,
      'Go to the element below in the location list (window local quickfix)'
    },
    Q = {
      function() vim.cmd('labo') end,
      'Go to the element above in the location list (window local quickfix)'
    },
    n = {
      function() require('donedone').add_entry() end,
      'Add a new donedone entry'
    }
  },
  ['<C-g>'] = { function() vim.cmd('DiffviewOpen main...HEAD') end, 'Open Diffview against dev branch' }
}

vim.keymap.set({ 'n', 'v' }, 'gh', '^')
vim.keymap.set({ 'n', 'v' }, 'gl', '$')

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
local Terminal = require('toggleterm.terminal').Terminal
local lazy_git = Terminal:new({ cmd = 'lazygit', direction = 'float', hidden = true })
whichkey.register({
  ['<leader>g'] = { function() lazy_git:toggle() end, 'Open LazyGit' },
})

--- DoneDone
local donedone = Terminal:new({ cmd = 'dndn', direction = 'float', hidden = true })
whichkey.register({
  ['<leader>;'] = { function() donedone:toggle() end, 'Open DoneDone' },
})

--- Telescope
local builtin = require('telescope.builtin')
whichkey.register {
  ['<leader>'] = {
    f = { builtin.find_files, 'Find files' },
    s = { builtin.live_grep, 'Find string' },
    G = { builtin.git_bcommits, 'Find git commits in current buffer' }
  },
  gd = { builtin.lsp_definitions, 'Go to definition(s)' },
  gr = { builtin.lsp_references, 'Go to reference(s)' }
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

--- macrothis
local macrothis = require('macrothis')

whichkey.register {
  ['<leader>'] = {
    M = {
      name = 'Macrothis',
      d = { macrothis.delete, 'Delete' },
      e = { macrothis.edit, 'Edit' },
      l = { macrothis.load, 'Load' },
      n = { macrothis.rename, 'Rename' },
      q = { macrothis.quickfix, 'Run macro on all files in quickfix' },
      r = { macrothis.run, 'Run macro' },
      s = { macrothis.save, 'Save' },
      x = { macrothis.register, 'Edit register' },
      p = { macrothis.copy_register_printable, 'Copy register as printable' },
      m = { macrothis.copy_macro_printable, 'Copy macro as printable' },
    }
  }
}
