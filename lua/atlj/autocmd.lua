-- Set the filetype to `ruby` if file ends with `.podspec`
-- Cocoapods spec files end with .podspec
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  pattern = { "*.podspec" },
  callback = function() vim.opt.filetype = "ruby" end
})
