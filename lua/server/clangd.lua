local root_dir_files = {
  ".clangd",
  ".clang-tidy",
  ".clang-format",
  "compile_commands.json",
  "compile_flags.txt",
  "configure.ac",
  ".git",
}

local M = {
  name = "clangd",
  cmd = { "clangd", },
  root_dir = vim.fs.dirname(vim.fs.find(root_dir_files, {
    upward = true,
    stop = vim.env.HOME,
  })[1]),
  settings = {},
}

return M
