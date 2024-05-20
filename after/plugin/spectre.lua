local spectre = require('spectre')

spectre.setup {
  find_engine = {
    ['rg'] = {
      cmd = "rg",
      -- default args
      args = {
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
      },
      options = {
        ['ignore-case'] = {
          value = "--ignore-case",
          icon = "[I]",
          desc = "ignore case"
        },
        ['hidden'] = {
          value = "--hidden",
          desc = "hidden file",
          icon = "[H]"
        },
        ['multiline'] = {
          value = "--multiline",
          desc = "multiline",
          icon = "[M]"
        }
        -- you can put any rg search option you want here it can toggle with
        -- show_option function
      }
    },
  }
}
