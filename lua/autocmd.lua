-- Format on save
vim.api.nvim_create_autocmd({ 'BufWrite' }, {
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

-- automatically install treesitter parser
local nvim_treesitter = require('nvim-treesitter')
local available_treesitter_languages = nvim_treesitter.get_available()

vim.api.nvim_create_autocmd({ 'FileType' }, {
  callback = function(args)
    local filetype = args.match
    local lang = vim.treesitter.language.get_lang(filetype)

    if not vim.list_contains(available_treesitter_languages, lang) then
      return
    end

    nvim_treesitter.install(lang):await(
      function()
        if not vim.api.nvim_buf_is_loaded(args.buf) then
          return
        end

        vim.treesitter.start(args.buf, lang)
      end
    )
  end
})
