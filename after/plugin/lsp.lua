-- It's important to setup neodev before lsp
-- https://github.com/folke/neodev.nvim#-setup
require("neodev").setup()
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

lsp.ensure_installed({
  "tsserver",
  "sumneko_lua",
})

lsp.on_attach(function(client, buffer)
  local options = { buffer = buffer, remap = false }

  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, options)
  vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float() end, options)
  vim.keymap.set("n", "<leader>a", function() vim.lsp.buf.code_action() end, options)
  vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.rename() end, options)
  vim.keymap.set("n", "<S- >", function() vim.lsp.buf.format { async = true } end, options)
  vim.keymap.set("i", "<S- >", function() vim.lsp.buf.format { async = true } end, options)
end)

lsp.setup_nvim_cmp({
  preselect = "none",
  select_behavior = "insert",
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
