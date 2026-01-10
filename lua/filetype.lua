vim.filetype.add {
  filename = {
    -- Treat podfiles as ruby files
    Podfile = "ruby",
  },
  extension = {
    -- .podspec is ruby too
    podspec = "ruby",
    -- expected by sourcekit. Normally its `objectivec`
    m = "objective-c",
    wgsl = "wgsl",
  }
}
