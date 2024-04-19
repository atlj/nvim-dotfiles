
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argv(0) == "" then
      require("telescope.builtin").find_files()
    end
  end,
})

vim.api.nvim_create_autocmd({ 'BufWrite' }, {
  callback = function()
    if vim.bo.filetype == 'typescript' or vim.bo.filetype == 'typescriptreact' then
      vim.cmd.EslintFixAll()
    else
      vim.cmd.LspZeroFormat()
    end
  end,
})
