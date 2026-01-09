require('blink.cmp').setup {
  -- Enable completion on the command line
  cmdline = { enabled = true },

  completion = {
    list = {
      selection = {
        -- Don't preselect the first option
        preselect = false,
        -- Auto insert the selected items
        auto_insert = true
      }
    },

    documentation = {
      -- Always show the documentation immediately
      auto_show = true,
      auto_show_delay_ms = 0
    },

    -- Display ghost text (useful when lsp has additional info like rust-analyzer)
    ghost_text = { enabled = true },
    menu = {
      draw = {
        -- Use treesitter to highlight the text in menu
        treesitter = { 'lsp' }
      }
    }
  },
  sources = {
    default = {
      'lsp',
      'path',
      -- Haven't configured snippets yet
      -- 'snippets',
      'buffer'
    },
  },

  fuzzy = {
    -- Use the rust fuzzy finder impl
    -- It warns if there is no bin.
    -- Since we use a release tag, this is never the case
    implementation = "prefer_rust_with_warning"
  },

  -- Displays signature help when you
  signature = { enabled = true },


  keymap = {
    preset = 'default',

    ['<C-n>'] = {
      function(cmp)
        if cmp.is_visible() then
          cmp.select_next()
        else
          cmp.show()
        end
      end,
    },
  }
}
