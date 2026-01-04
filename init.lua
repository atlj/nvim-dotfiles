function ReloadConfig()
  for name,_ in pairs(package.loaded) do
    if name:match('^cnull') then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
end

vim.api.nvim_create_user_command('ReloadConfig', ReloadConfig, {})

require("set")
require("map")

