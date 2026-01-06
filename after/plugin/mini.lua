-- File picker
require('mini.files').setup {
  mappings = {
    synchronize = '<CR>',
    go_in_plus  = 'l',
  },
  windows = {
    preview = true
  }
}

-- Makes it easier to work with the surrounding characters
-- Select something and press s+a+'
require('mini.surround').setup()
