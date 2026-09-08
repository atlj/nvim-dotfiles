-- Third party packages

--- GH helper
local function g(x) return 'https://github.com/' .. x end

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
    {
      src = g('nvim-treesitter/nvim-treesitter'),
      version = 'master'
    },

    -- Floating terminals. Useful for lazygit.
    g('akinsho/toggleterm.nvim'),

    -- Git blame
    g('lewis6991/gitsigns.nvim'),

    -- LSP
    -- Premade LSP configurations
    g('neovim/nvim-lspconfig'),
    -- A way to install LSP servers
    g('mason-org/mason.nvim'),
    -- Bridge between those two
    g('mason-org/mason-lspconfig.nvim'),
    -- Typed vim api
    g('folke/lazydev.nvim'),

    -- Autocomplete menu
    {
      src = g('saghen/blink.cmp'),
      version = 'v1.8.0'
    },

    -- Commenting on jsx doesn't break the file
    g('folke/ts-comments.nvim'),

    -- Inline diagnostics
    g('rachartier/tiny-inline-diagnostic.nvim'),

    -- Diff Viewer, makes code reviews easier
    g('sindrets/diffview.nvim'),

    -- ColorScheme
    g('savq/melange-nvim'),
    g('ThorstenRhau/token'),

    -- A better UI Picker
    g('stevearc/dressing.nvim'),

    -- >> Start of Depends on Plenary
    g('nvim-lua/plenary.nvim'),
    -- A better TypeScript LSP
    g('pmizio/typescript-tools.nvim'),
    -- A tool to save buffers per project
    {
      src = g('ThePrimeagen/harpoon'),
      version = "harpoon2"
    },
    -- << End of Depends on Plenary
  },
  {
    -- Don't ask for confirmation
    confirm = false
  }
)
