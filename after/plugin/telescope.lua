local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup({
  pickers = {
    git_bcommits = {
      layout_strategy = 'vertical'
    }
  },
  defaults = {
    mappings = {
      i = {
        ['<C-j>'] = actions.cycle_history_next,
        ['<C-k>'] = actions.cycle_history_prev,
      },
      n = { ['q'] = actions.close },
    }
  }
})
