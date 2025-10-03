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
  cmd = { '/Applications/Xcode-16.2.0.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp' },
  -- cmd = { 'sourcekit-lsp' },
  on_attach = lsp.on_attach,
  capabilities = lsp.capabilities,
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false
  }
)

-- vim.lsp.config("ts_go_ls", {
--   cmd = { vim.loop.os_homedir() .. "/kod/typescript-go/built/local/tsgo", "lsp", "-stdio" },
--   filetypes = {
--     "javascript",
--     "javascriptreact",
--     "javascript.jsx",
--     "typescript",
--     "typescriptreact",
--     "typescript.tsx",
--   },
--   root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
-- })
-- vim.lsp.enable("ts_go_ls")
