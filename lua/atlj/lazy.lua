-- Setup lazy by cloning it if it isn't installed
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  -- LANGUAGE TOOLS
  {
    -- Language Server
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },             -- Required
      { 'williamboman/mason.nvim' },           -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional
      -- Autocompletion
      { 'hrsh7th/cmp-nvim-lsp' },              -- Required
      { 'hrsh7th/cmp-buffer' },                -- Optional
      { 'hrsh7th/cmp-path' },                  -- Optional
      { 'hrsh7th/cmp-nvim-lua' },              -- Optional
      -- Snippets
      -- { 'L3MON4D3/LuaSnip' },                  -- Required
    }
  },
  {
    -- Syntax highlighting
    'nvim-treesitter/nvim-treesitter',
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  },
  {
    -- Autocompletion menu
    'hrsh7th/nvim-cmp',
  },
  {
    -- A better typescript support
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    lazy = true
  },
  {
    -- nvim lua plugin development language support
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    -- Inline function signature help
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    lazy = true
  },
  {
    -- Automatically sleep LSPs that are idle
    "hinell/lsp-timeout.nvim"
  },
  {
    -- Better inline diagnostics
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach"
  },

  -- EDITING
  {
    -- Pair support
    'windwp/nvim-autopairs',
    lazy = true
  },
  {
    -- Toggling comments under the cursor
    'numToStr/Comment.nvim',
    lazy = true
  },
  {
    -- Automatically closes all the buffers
    'famiu/bufdelete.nvim',
    lazy = true
  },

  -- BROWSING
  {
    -- Fuzzy finder
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {}
  },
  {
    -- Bookmarks
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("harpoon").setup()
    end,
    lazy = true
  },
  {
    -- Various plugins, mini.files is a great file manager
    'echasnovski/mini.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = true
  },

  -- UI
  {
    -- Terminal UI
    'akinsho/toggleterm.nvim',
    lazy = true
  },
  {
    -- Git changes in editor
    'lewis6991/gitsigns.nvim',
    lazy = true,
  },
  {
    -- Git diff tab
    'sindrets/diffview.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    lazy = true
  },
  'stevearc/dressing.nvim', -- UI component enhancements
  {
    -- A key helper
    'folke/which-key.nvim',
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    lazy = true
  },
  {
    -- TODO manager
    name = "donedone",
    dir = "~/kod/donedone/",
    dev = true,
    opts = {}
  },

  -- COLORSCHEMES
  {
    'savq/melange-nvim',
    name = 'melange',
  },
  -- {
  --   'ribru17/bamboo.nvim',
  --   lazy = false,
  -- },
  -- "nyoom-engineering/oxocarbon.nvim",
  -- "xero/miasma.nvim",
  -- "vague2k/vague.nvim",
  -- "ajmwagar/vim-deus",
  -- {
  --   'sainnhe/everforest',
  -- },
  -- { "rose-pine/neovim",        name = "rose-pine" },
}
