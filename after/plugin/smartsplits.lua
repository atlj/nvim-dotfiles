-- With this plugin, we can move between windows easily
local smartsplits = require("smart-splits")

smartsplits.setup({
  -- the default number of lines/columns to resize by at a time
  default_amount = 3,
  -- whether to wrap to opposite side when cursor is at an edge
  -- e.g. by default, moving left at the left edge will jump
  -- to the rightmost window, and vice versa, same for up/down.
  wrap_at_edge = true,
  -- when moving cursor between splits left or right,
  -- place the cursor on the same row of the *screen*
  -- regardless of line numbers. False by default.
  -- Can be overridden via function parameter, see Usage.
  move_cursor_same_row = false,
  -- resize mode options
  resize_mode = {
    -- key to exit persistent resize mode
    quit_key = '<ESC>',
    -- keys to use for moving in resize mode
    -- in order of left, down, up' right
    resize_keys = { 'h', 'j', 'k', 'l' },
    -- set to true to silence the notifications
    -- when entering/exiting persistent resize mode
    silent = false,
    -- must be functions, they will be executed when
    -- entering or exiting the resize mode
    hooks = {
      on_enter = nil,
      on_leave = nil,
    },
  },
  -- ignore these autocmd events (via :h eventignore) while processing
  -- smart-splits.nvim computations, which involve visiting different
  -- buffers and windows. These events will be ignored during processing,
  -- and un-ignored on completed. This only applies to resize events,
  -- not cursor movement events.
  ignored_events = {
    'BufEnter',
    'WinEnter',
  },
  -- enable or disable the tmux integration
  tmux_integration = true,
  -- disable tmux navigation if current tmux pane is zoomed
  disable_tmux_nav_when_zoomed = true,
})

vim.keymap.set({ "n", "i", "t" }, "<C-l>", smartsplits.move_cursor_right)
vim.keymap.set({ "n", "i", "t" }, "<C-h>", smartsplits.move_cursor_left)
vim.keymap.set({ "n", "i", "t" }, "<C-j>", smartsplits.move_cursor_down)
vim.keymap.set({ "n", "i", "t" }, "<C-k>", smartsplits.move_cursor_up)
