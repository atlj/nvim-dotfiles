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
    "lua_ls"
  }
})

