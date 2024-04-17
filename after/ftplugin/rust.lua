local bufnr = vim.api.nvim_get_current_buf()

vim.keymap.set("n", "<S-j>", function()
  vim.cmd.RustLsp("joinLines")
end, { silent = true, buffer = bufnr, desc = "Rustaceanvim: joinLines" })
