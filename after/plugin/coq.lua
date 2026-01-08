vim.g.coq_settings = {
  auto_start = true,
  xdg = true,
  clients = {
    snippets = {
      -- Don't show a warning for no snippets
      warn = {}
    }
  },
  display = {
    pum = {
      -- Don't repeatedly close and open windows
      fast_close = false,
    },
  },
  keymap = {
    -- Useful for some LSPs like rust_analyzer which have marks. This will always jump to the next mark.
    jump_to_mark = '<C-y>',
  }
}

vim.cmd.COQnow('--shut-up')
