local function g(x) return 'https://github.com/' .. x end

local function hooks(ev)
  local name, kind = ev.data.spec.name, ev.data.kind

  -- Build treesitter
  if name == 'nvim-treesitter' and (kind == 'install' or kind == 'update') then
    vim.cmd.TSUpdate()
  end
end
vim.api.nvim_create_autocmd('PackChanged', { callback = hooks })

vim.pack.add(
  {
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

    -- Floating terminals. Useful for lazygit.
    g('akinsho/toggleterm.nvim'),
  },
  {
    -- Don't ask for confirmation
    confirm = false
  }
) 
