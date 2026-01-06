require('nvim-treesitter').setup {
  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = ',',
      node_incremental = ',',
      node_decremental = '<bs>',
      scope_incremental = '<tab>',
    },
  },
}

vim.treesitter.language.register('objc', 'objective-cpp')
vim.treesitter.language.register('objc', 'objective-c')
