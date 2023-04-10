-- Install packer if it's not installed already
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd [[packadd packer.nvim]]
end

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use({
    'nyoom-engineering/oxocarbon.nvim',
    as = "oxocarbon",
    config = function()
      vim.cmd('colorscheme oxocarbon')
    end
  })

  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      { 'williamboman/mason.nvim' }, -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional
      -- Autocompletion
      { 'hrsh7th/nvim-cmp' }, -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'hrsh7th/cmp-buffer' }, -- Optional
      { 'hrsh7th/cmp-path' }, -- Optional
      { 'hrsh7th/cmp-nvim-lua' }, -- Optional
      { 'saadparwaiz1/cmp_luasnip' }, -- Optional
      -- Snippets
      { 'L3MON4D3/LuaSnip' }, -- Required
    }
  }

  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }

  use("windwp/nvim-autopairs")
  use("akinsho/toggleterm.nvim")
  use('mrjones2014/smart-splits.nvim')
  use{
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end
  }
  use {
    'akinsho/bufferline.nvim',
    config = function()
      require("bufferline").setup{}
    end,
    tag = "v3.*",
    requires = 'nvim-tree/nvim-web-devicons'
  }
  use 'famiu/bufdelete.nvim'
  use 'numToStr/Comment.nvim'
  use {
    'lewis6991/gitsigns.nvim',
    tag = 'release',
  }
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  use({
    "atlj/Pixie.nvim",
    run = function() vim.cmd.PixieInstall() end
  })
  use "folke/neodev.nvim"

  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  use({
  "jackMort/ChatGPT.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
})

  if is_bootstrap then
    require('packer').sync()
  end
end)
