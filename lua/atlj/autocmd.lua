-- If no file is passed to neovim, open telescope at startup
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argv(0) == "" then
      require("telescope.builtin").find_files()
    end
  end,
})

vim.api.nvim_create_autocmd({ 'BufWrite' }, {
  callback = function(args)
    if vim.fn.exists ':EslintFixAll' == 2 then
      vim.cmd.EslintFixAll()
    elseif vim.fn.exists ':LspZeroFormat' == 2 then
      vim.cmd.LspZeroFormat()
    end
  end,
})

-- vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
--   callback = function(opts)
--     if (opts.file == "") then
--       return
--     end
--
--     vim.cmd.loadview()
--   end
-- })
--
-- vim.api.nvim_create_autocmd({ 'BufWinLeave' }, {
--   callback = function(opts)
--     if (opts.file == "") then
--       return
--     end
--
--     vim.cmd.mkview()
--   end
-- })
