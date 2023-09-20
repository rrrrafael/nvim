local get_intelephense_licence = function()
  local f = assert(io.open(os.getenv("HOME") .. "/intelephense/licence.txt", "rb"))
  local content = f:read("*a")
  f:close()
  return string.gsub(content, "%s+", "")
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "php" })
      end
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        intelephense = {
          init_options = {
            licenceKey = get_intelephense_licence(),
          },
        },
      },
    },
  },
}
