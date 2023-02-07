require("toggleterm").setup {
  size = 50,
  direction = "vertical",
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.3
    end
  end,
}

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", direction = "float", hidden = true })

function _lazygit_toggle()
  lazygit:toggle()
end

vim.keymap.set({"n", "t"}, "<C-j>", vim.cmd.ToggleTerm)
vim.keymap.set("n", "<leader>g", function() vim.cmd("lua _lazygit_toggle()") end)
