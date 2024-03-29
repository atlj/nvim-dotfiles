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
  -- {
  --   'ribru17/bamboo.nvim',
  --   lazy = false,
  -- },
  -- "nyoom-engineering/oxocarbon.nvim",
  {
    'savq/melange-nvim',
    name = 'melange',
    config = function()
      vim.cmd('colorscheme melange')
    end
  },
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
  'windwp/nvim-autopairs',
  'akinsho/toggleterm.nvim',
  {
    'folke/which-key.nvim',
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end
  },
  {
    'akinsho/bufferline.nvim',
    config = function()
      require('bufferline').setup()
    end,
    dependencies = 'nvim-tree/nvim-web-devicons'
  },
  'famiu/bufdelete.nvim',
  'numToStr/Comment.nvim',
  {
    'lewis6991/gitsigns.nvim'
  },
  {
    'atlj/Pixie.nvim',
    build = function() vim.cmd.PixieInstall() end
  },
  'folke/neodev.nvim',
  { 'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim' },
  'stevearc/dressing.nvim',
  {
    'zbirenbaum/copilot.lua',
  },

  'mfussenegger/nvim-dap',
  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfussenegger/nvim-dap'
    }
  },
  {
    'theHamsta/nvim-dap-virtual-text',
    dependencies = {
      'mfussenegger/nvim-dap'
    }
  },
  'echasnovski/mini.nvim',
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup()
    end
  },
  'nvim-lualine/lualine.nvim',
  'andweeb/presence.nvim',
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
  }
}
