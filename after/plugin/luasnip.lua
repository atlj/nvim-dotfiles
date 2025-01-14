local ls = require "luasnip"

ls.config.set_config {
  history = true,

  updateevents = "TextChanged,TextChangedI",
}

ls.snippets = {
  lua = {
    ls.parser.parse_snippet("burak", "local  $1 = function($2)\n  $0\nend")
  }
}
