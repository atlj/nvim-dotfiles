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
  virtual_text = false, -- handled by tiny-inline-diagnostic.lua
  signs = false,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})

local lspconfig = require('lspconfig')

lspconfig.sourcekit.setup {
  cmd = { '/Applications/Xcode-16.0.0.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp' },
  -- cmd = { 'sourcekit-lsp' },
  on_attach = lsp.on_attach,
  capabilities = lsp.capabilities,
}

lspconfig.wgsl_analyzer.setup({
  on_attach = lsp.on_attach,
  capabilities = lsp.capabilities,
})

-- lspconfig.clangd.setup({
--   on_attach = lsp.on_attach,
--   capabilities = lsp.capabilities,
-- })
