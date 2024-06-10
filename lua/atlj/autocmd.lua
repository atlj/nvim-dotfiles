-- If no file is passed to neovim, open telescope at startup
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argv(0) == "" then
      require("telescope.builtin").find_files()
    end
  end,
})

-- Automatically format on save using EslintFixAll
vim.api.nvim_create_autocmd({ 'BufWrite' }, {
  callback = function()
    if vim.bo.filetype == 'typescript' or vim.bo.filetype == 'typescriptreact' then
      vim.cmd.EslintFixAll()
    else
      vim.cmd.LspZeroFormat()
    end
  end,
})

vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
  callback = function(opts)
    if (opts.file == "") then
      return
    end

    vim.cmd.loadview()
  end
})

vim.api.nvim_create_autocmd({ 'BufWinLeave' }, {
  callback = function(opts)
    if (opts.file == "") then
      return
    end

    vim.cmd.mkview()
  end
})
