local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
autocmd("TextYankPost", {
  group = augroup("YankHighlight", { clear = true }),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      timeout = 20,
      higroup = "TermCursor",
    })
  end,
})

-- close some filetypes with <q>
autocmd("FileType", {
  group = augroup("FileTypeClose", { clear = true }),
  pattern = {
    "help",
    "lspinfo",
    "man",
    "query",
    "checkhealth",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, { buffer = args.buf })
    vim.keymap.set("n", "gD",         vim.lsp.buf.declaration, { buffer = args.buf })
    vim.keymap.set("n", "K",          vim.lsp.buf.hover, { buffer = args.buf })
    vim.keymap.set("n", "<Leader>gi", vim.lsp.buf.implementation,{ buffer = args.buf })
    vim.keymap.set("n", "<Leader>gr", vim.lsp.buf.references, { buffer = args.buf })
    vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, { buffer = args.buf })
    vim.keymap.set("n", "<C-k>",      vim.lsp.buf.signature_help,{ buffer = args.buf })
    vim.keymap.set("n", "<Leader>wa", vim.lsp.buf.add_workspace_folder, { buffer = args.buf })
    vim.keymap.set("n", "<Leader>wr", vim.lsp.buf.remove_workspace_folder, { buffer = args.buf })
    vim.keymap.set("n", "<Leader>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workLeader_folders()))
    end, { buffer = args.buf })

    vim.api.nvim_buf_create_user_command(args.buf, "Format", function(_)
      vim.lsp.buf.format()
    end, {})
  end,
})
