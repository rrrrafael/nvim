vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(_)
    vim.lsp.handlers["textDocument/diagnostic"] = vim.lsp.with(
      vim.lsp.diagnostic.on_diagnostic, {
        underline = true,
        virtual_text = false,
        update_in_insert = false,
      }
    )

    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = false,
        update_in_insert = false,
      }
    )
  end,
})

-- keymaps
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end
vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float)
vim.keymap.set("n", "]d", diagnostic_goto(true))
vim.keymap.set("n", "[d", diagnostic_goto(false))
vim.keymap.set("n", "]e", diagnostic_goto(true, "ERROR"))
vim.keymap.set("n", "[e", diagnostic_goto(false, "ERROR"))
vim.keymap.set("n", "]w", diagnostic_goto(true, "WARN"))
vim.keymap.set("n", "[w", diagnostic_goto(false, "WARN"))
