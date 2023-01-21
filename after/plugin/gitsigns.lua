local gitsigns = require("gitsigns")
gitsigns.setup()

vim.keymap.set("n", "<leader>b", gitsigns.blame_line)
