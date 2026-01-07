vim.g.coq_settings = {
  auto_start = true,
  xdg = true,
  clients = {
    snippets = {
      warn = {}
    }
  }
}

vim.cmd.COQnow('--shut-up')
