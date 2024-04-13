local mini_surround = {
  mappings = {
    add = "gy",
    delete = "dy",
    find = "",
    find_left = "",
    highlight = "",
    replace = "cy",
    update_n_lines = "",
    suffix_last = "",
    suffix_next = "",
  },
}

local lazy = {
  "echasnovski/mini.surround",
  keys = {
    { "gy", mode = { "n", "v" } },
    { "dy", mode = { "n", "v" } },
    { "cy", mode = { "n", "v" } },
  },
  opts = mini_surround,
}

return lazy
