local function g(x) return 'https://github.com/' .. x end

vim.pack.add {
  -- Various plugins. Like mini.files which is a file manager
  g('nvim-mini/mini.nvim'),

  -- Shows key mapping
  g('folke/which-key.nvim'),

  -- Fuzzy finding
  g('ibhagwan/fzf-lua'),
  g('nvim-tree/nvim-web-devicons'),

  -- Automatically add pairs
  g('windwp/nvim-autopairs'),

  -- Syntax highlighting
  g('nvim-treesitter/nvim-treesitter'),
}
