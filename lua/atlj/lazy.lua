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
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" }
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim'
    }
  },
  {
    "ajmwagar/vim-deus"
  },
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    'hrsh7th/nvim-cmp',
    -- opts = function(_, opts)
    --   opts.sources = opts.sources or {}
    --   table.insert(opts.sources, {
    --     name = "lazydev",
    --     group_index = 0, -- set group index to 0 to skip loading LuaLS completions
    --   })
    -- end,
  }, -- Required
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("harpoon").setup()
    end,
    lazy = true
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
  "xero/miasma.nvim",
  -- {
  --   'sainnhe/everforest',
  -- },
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
  { 'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim', lazy = true },
  {
    name = "donedone",
    dir = "~/kod/donedone/",
    dev = true,
    opts = {}
  },
  { 'stevearc/dressing.nvim' },
  {
    'echasnovski/mini.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = true
  },
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup()
    end,
    lazy = true
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    lazy = true
  },
  {
    "desdic/macrothis.nvim",
    opts = {},
    lazy = true
  },
}
