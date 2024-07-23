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
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim'
    }
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("harpoon").setup()
    end
  },
  -- {
  --   'ribru17/bamboo.nvim',
  --   lazy = false,
  -- },
  -- "nyoom-engineering/oxocarbon.nvim",
  {
    'savq/melange-nvim',
    name = 'melange',
  },
  {
    'sainnhe/everforest',
  },
  -- { "rose-pine/neovim",        name = "rose-pine" },
  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },             -- Required
      { 'williamboman/mason.nvim' },           -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional
      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },                  -- Required
      { 'hrsh7th/cmp-nvim-lsp' },              -- Required
      { 'hrsh7th/cmp-buffer' },                -- Optional
      { 'hrsh7th/cmp-path' },                  -- Optional
      { 'hrsh7th/cmp-nvim-lua' },              -- Optional
      -- Snippets
      { 'L3MON4D3/LuaSnip' },                  -- Required
    }
  },
  { 'windwp/nvim-autopairs',   lazy = true },
  { 'akinsho/toggleterm.nvim', lazy = true },
  {
    'folke/which-key.nvim',
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    lazy = true
  },
  { 'famiu/bufdelete.nvim',  lazy = true },
  { 'numToStr/Comment.nvim', lazy = true },
  {
    'lewis6991/gitsigns.nvim',
    lazy = true,
  },
  {
    'atlj/Pixie.nvim',
    build = function() vim.cmd.PixieInstall() end,
    lazy = true,
  },
  'folke/neodev.nvim',
  { 'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim', lazy = true },
  'stevearc/dressing.nvim',
  -- {
  --   'zbirenbaum/copilot.lua',
  --   lazy = true
  -- },
  {
    'echasnovski/mini.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup()
    end
  },
  { 'andweeb/presence.nvim',  lazy = true },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
  },
  'nvim-pack/nvim-spectre',
  {
    "desdic/macrothis.nvim",
    opts = {}
  },
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim", -- required by telescope
      "MunifTanjim/nui.nvim",

      -- optional
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      -- configuration goes here
    },
  },
}
