local M = {}

M = {
  name = "bash_language_server",
  cmd = { "bash-language-server", "start" },
  setting = {
    bash = {
      bashIde = {
        globPattern = "*@(.sh|.inc|.bash|.command)"
      },
    }
  },
}

return M
