-- Set the filetype to `ruby` if file ends with `.podspec` or is named `Podfile`
vim.api.nvim_create_autocmd({ 'BufReadPost' }, {
  pattern = { '*.podspec', 'Podfile' },
  callback = function() vim.opt.filetype = 'ruby' end
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
