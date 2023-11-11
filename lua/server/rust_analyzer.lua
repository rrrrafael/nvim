local root_dir_files = {
  "Cargo.toml",
  "rust-project.json",
}

local M = {
  name = "rust_analyzer",
  cmd = { "rust_analyzer" },
  root_dir = vim.fs.dirname( vim.fs.find( root_dir_files, {
      upward = true,
      stop = vim.env.HOME,
    })[1]),
}

return M
