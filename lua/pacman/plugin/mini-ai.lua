local mini_ai = {
  options = {
    silent = true,
  },
}
local lazy = {
  "echasnovski/mini.ai",
  keys = {
    { "a", mode = { "x", "o" } },
    { "i", mode = { "x", "o" } },
  },
  opts = mini_ai.options,
}

return lazy
