std = "lua51"
ignore = {
  "111", -- setting non-standard global variable
  "112", -- mutating non-standard global variable
  "113", -- accessing undefined variable (GMod workspace)
  "211", -- unused variable
  "212", -- unused argument
}
read_globals = {
  "describe", "it", "before_each", "after_each", "setup", "teardown",
  "assert", "spy", "mock", "stub", "match"
}
