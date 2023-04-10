-- It's important to setup neodev before lsp
-- https://github.com/folke/neodev.nvim#-setup
require('neodev').setup()
local lsp = require('lsp-zero')

lsp.set_preferences({
  suggest_lsp_servers = true,
  setup_servers_on_start = true,
  set_lsp_keymaps = false,
  configure_diagnostics = true,
  cmp_capabilities = true,
  manage_nvim_cmp = true,
  call_servers = 'local',
})

lsp.setup_nvim_cmp({
  preselect = 'none',
  select_behavior = 'insert',
  completion = {
    completeopt = 'menu,menuone,noinsert,noselect'
  },
})

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
  signs = false,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})
