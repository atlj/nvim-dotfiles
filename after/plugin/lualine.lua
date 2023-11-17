require('lualine').setup {
  sections = {
    -- Remove file encoding and file format
    lualine_x = { 'filetype' },
  }
}
