local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require('telescope.builtin')

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<C-j>"] = actions.cycle_history_next,
				["<C-k>"] = actions.cycle_history_prev,
			},
			n = { ["q"] = actions.close },
		}
	}
})

vim.keymap.set('n', '<leader>f', builtin.git_files, {}) -- Respects .gitignore
vim.keymap.set('n', '<leader>;', builtin.find_files, {}) -- Looks for all files
vim.keymap.set('n', '<leader>s', builtin.live_grep, {}) -- Searchs for a string, respects .gitignore
