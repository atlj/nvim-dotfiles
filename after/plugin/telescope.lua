local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.git_files, {}) -- Respects .gitignore
vim.keymap.set('n', '<leader>;', builtin.find_files, {}) -- Looks for all files
vim.keymap.set('n', '<leader>s', builtin.live_grep, {}) -- Searchs for a string, respects .gitignore
