-- Set the filetype to `ruby` if file ends with `.podspec` or is named `Podfile`
vim.api.nvim_create_autocmd({ 'BufReadPost' }, {
  pattern = { '*.podspec', 'Podfile' },
  callback = function() vim.opt.filetype = 'ruby' end
})
