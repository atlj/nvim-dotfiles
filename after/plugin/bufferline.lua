require("bufferline").setup {}

vim.keymap.set("n", "<S-l>", vim.cmd.BufferLineCycleNext)
vim.keymap.set("n", "<S-h>", vim.cmd.BufferLineCyclePrev)
vim.keymap.set("n", "<leader>c", function() require("bufdelete").bufdelete(0, false) end)
vim.keymap.set("n", "<leader>c", function() require("bufdelete").bufdelete(0, true) end)
