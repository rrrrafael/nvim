
local root_dir_files = {
  ".marksman.toml",
  ".git",
}

local M = {
  name = "marksman",
  cmd = { "marksman", "server", },
  root_dir = vim.fs.dirname(vim.fs.find(root_dir_files, {
    upward = true,
    stop = vim.env.HOME,
  })[1]),
  settings = {}
}

return M
