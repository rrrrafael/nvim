vim.bo.shiftwidth = 2
vim.bo.expandtab = true

vim.lsp.start(require("server.lua_language_server"))
