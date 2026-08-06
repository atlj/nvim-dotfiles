-- :h vim.diagnostic
vim.diagnostic.config({
  signs = {
    -- Don't display signs for warnings and errors
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
    },
    numhl = {
      -- Highlight the line number for warnings and errors
      [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
      [vim.diagnostic.severity.WARN] = 'WarningMsg',
    },
  },
  -- Don't display an underline for lsp problems
  underline = false
})

-- 1. Setup Mason
require('mason').setup()

-- 2. Setup the bridge between Mason and lspconfig
require("mason-lspconfig").setup({
  -- Make sure the following servers are installed
  ensure_installed = {
    "lua_ls",
    "rust_analyzer",
    "eslint", -- JS
    "biome",  -- JS linter and formatter
    "taplo",  -- TOML linter
  },
})

-- 3. Setup lsp servers that don't exist in Mason
vim.lsp.enable({
  'gdscript',  -- Godot
  'sourcekit', -- Apple
})

-- Setup vim api LSP when you enter a lua file

local did_load_lazydev = false
vim.api.nvim_create_autocmd({ 'BufNew' }, {
  pattern = { '*.lua' },
  callback = function()
    if did_load_lazydev then
      return
    end

    require('lazydev').setup()
    did_load_lazydev = true
  end
})
