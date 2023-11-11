local get_intelephense_licence = function()
  local f = assert(io.open(os.getenv("HOME") .. "/intelephense/licence.txt", "rb"))
  local content = f:read("*a")
  f:close()
  return string.gsub(content, "%s+", "")
end

local root_dir_files = {
  "composer.json",
  ".git",
}

local M = {
  name = "intelephense",
  cmd = { "intelephense", "--stdio" },
  root_dir = vim.fs.dirname( vim.fs.find( root_dir_files, {
    upward = true,
    stop = vim.env.HOME,
  })[1]),
  setting = {
    intelephense = {
      init_options = {
        licenceKey = get_intelephense_licence(),
      },
    },
  },
}

return M
