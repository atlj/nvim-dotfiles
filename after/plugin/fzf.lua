local actions = require("fzf-lua").actions
require("fzf-lua").setup {
  -- MISC GLOBAL SETUP OPTIONS, SEE BELOW
  -- fzf_bin = ...,
  -- each of these options can also be passed as function that return options table
  -- e.g. winopts = function() return { ... } end
  winopts = {
    -- border argument passthrough to nvim_open_win()
    border     = "single",
    -- Backdrop opacity, 0 is fully opaque, 100 is fully transparent (i.e. disabled)
    backdrop   = 70,
    fullscreen = false, -- start fullscreen?
    treesitter = {
      enabled    = true,
      fzf_colors = { ["hl"] = "-1:reverse", ["hl+"] = "-1:reverse" }
    },
    preview    = {
      border       = "single",    -- preview border: accepts both `nvim_open_win`
      wrap         = true,        -- preview line wrap (fzf's 'wrap|nowrap')
      hidden       = false,       -- start preview hidden
      vertical     = "down:45%",  -- up|down:size
      horizontal   = "right:60%", -- right|left:size
      layout       = "flex",      -- horizontal|vertical|flex
      flip_columns = 100,         -- #cols to switch to horizontal on flex
      -- Only used with the builtin previewer:
      title        = true,        -- preview border title (file/buf)?
      title_pos    = "center",    -- left|center|right, title alignment
      scrollbar    = false,       -- `false` or string:'float|border'
      -- float:  in-window floating border
      -- border: in-border "block" marker
      scrolloff    = -1, -- float scrollbar offset from right
      -- applies only when scrollbar = 'float'
      delay        = 0,  -- delay(ms) displaying the preview
      -- prevents lag on fast scrolling
      winopts      = {   -- builtin previewer window options
        number         = true,
        relativenumber = false,
        cursorline     = false,
        cursorlineopt  = "both",
        cursorcolumn   = false,
        signcolumn     = "no",
        list           = false,
        foldenable     = false,
        foldmethod     = "manual",
      },
    },
  },
  actions = {
    -- Below are the default actions, setting any value in these tables will override
    -- the defaults, to inherit from the defaults change [1] from `false` to `true`
    files = {
      ["enter"]  = actions.file_edit_or_qf,
      ["ctrl-s"] = actions.file_split,
      ["ctrl-v"] = actions.file_vsplit,
      ["ctrl-q"] = actions.file_sel_to_qf,
    },
  },
  files = {
    cwd_prompt = false,
    hidden     = true,  -- enable hidden files by default
    follow     = false, -- do not follow symlinks by default
    no_ignore  = false, -- respect ".gitignore"  by default
  },
  grep = {
    prompt         = 'Rg❯ ',
    input_prompt   = 'Grep For❯ ',
    multiprocess   = true,  -- run command in a separate process
    git_icons      = false, -- show git icons?
    file_icons     = true,  -- show file icons (true|"devicons"|"mini")?
    color_icons    = true,  -- colorize file|git icons
    grep_opts      = "--binary-files=without-match --line-number --recursive --color=auto --perl-regexp -e",
    rg_opts        = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -e",
    hidden         = false,     -- disable hidden files by default
    follow         = false,     -- do not follow symlinks by default
    no_ignore      = false,     -- respect ".gitignore"  by default
    rg_glob        = true,      -- default to glob parsing with `rg`
    glob_flag      = "--iglob", -- for case sensitive globs use '--glob'
    glob_separator = "%s%-%-",  -- query separator pattern (lua): ' --'
    no_header      = true,      -- hide grep|cwd header?
    no_header_i    = true,      -- hide interactive header?
  },
}
