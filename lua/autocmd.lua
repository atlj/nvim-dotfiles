-- Format on save
vim.api.nvim_create_autocmd({'BufWrite'}, {
  callback = function()
    -- Eslint is special...
    if vim.fn.exists ':LspEslintFixAll' == 2 then
      -- So we have to use its dedicated format command
      vim.cmd.LspEslintFixAll()
    else
      vim.lsp.buf.format()
    end
  end
})
