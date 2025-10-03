return {
  -- A snippet that expands the trigger "hi" into the string "Hello, world!".
  s(
    { trig = "hel" },
    { t("Hello, world!") }
  ),

  -- To return multiple snippets, use one `return` statement per snippet file
  -- and return a table of Lua snippets.
  s(
    { trig = "foo" },
    { t("Another snippet.") }
  ),
}
