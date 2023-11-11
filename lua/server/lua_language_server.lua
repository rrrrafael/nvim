local root_dir_files = {
  ".luarc.json",
  ".luarc.jsonc",
  ".luacheckrc",
  ".stylua.toml",
  "stylua.toml",
  "selene.toml",
  "selene.yml",
  ".git",
}

local M = {
  name = "lua_language_server",
  cmd = { "lua-language-server", },
  root_dir = vim.fs.dirname(vim.fs.find(root_dir_files, {
    upward = true,
    stop = vim.env.HOME,
  })[1]),
  settings = {
    Lua = {
      completion = {
        keywordSnippet = "Both",
      },
      diagnostics = {
        globals = { "vim" },
      },
      runtime = {
        version = "LuaJIT",
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
        },
      },
      telemetry = { enable = false },
    }
  }
}

return M
