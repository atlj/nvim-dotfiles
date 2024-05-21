-- -- Lua
-- require('bamboo').setup {
--   -- Main options --
--   -- NOTE: to use the light theme, set `vim.o.background = 'light'`
--   style = 'vulgaris',                                       -- Choose between 'vulgaris' (regular), 'multiplex' (greener), and 'light'
--   toggle_style_key = nil,                                   -- Keybind to toggle theme style. Leave it nil to disable it, or set it to a string, e.g. "<leader>ts"
--   toggle_style_list = { 'vulgaris', 'multiplex', 'light' }, -- List of styles to toggle between
--   transparent = false,                                      -- Show/hide background
--   dim_inactive = false,                                     -- Dim inactive windows/buffers
--   term_colors = true,                                       -- Change terminal color as per the selected theme style
--   ending_tildes = false,                                    -- Show the end-of-buffer tildes. By default they are hidden
--   cmp_itemkind_reverse = false,                             -- reverse item kind highlights in cmp menu
--
--   -- Change code style ---
--   -- Options are italic, bold, underline, none
--   -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
--   code_style = {
--     comments = 'italic',
--     conditionals = 'italic',
--     keywords = 'none',
--     functions = 'none',
--     namespaces = 'italic',
--     parameters = 'italic',
--     strings = 'none',
--     variables = 'none',
--   },
--
--   -- Lualine options --
--   lualine = {
--     transparent = false, -- lualine center bar transparency
--   },
--
--   -- Custom Highlights --
--   colors = {},     -- Override default colors
--   highlights = {}, -- Override highlight groups
--
--   -- Plugins Config --
--   diagnostics = {
--     darker = false,    -- darker colors for diagnostic
--     undercurl = true,  -- use undercurl instead of underline for diagnostics
--     background = true, -- use background color for virtual text
--   },
-- }
--
-- require('bamboo').load()
-- vim.cmd("colorscheme oxocarbon")

-- vim.cmd('colorscheme melange')
vim.g.everforest_colors_override = {
  bg0 = { '#0B1419', '234' },
  -- bg1 = { '#0B1419', '234' },
  bg2 = { '#0B1419', '234' }
}
-- vim.g.everforest_colors_override = { bg0 = { '#1E2428', '234' } }
-- vim.g.everforest_colors_override = { bg0 = { '#171B1E', '234' } }
vim.cmd.colorscheme('everforest')
-- vim.api.nvim_set_hl(0, "Normal", { bg = "#1c1c1c" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1c1c1c" })
