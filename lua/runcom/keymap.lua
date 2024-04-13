vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

-- Readline command-line editing
vim.keymap.set("c", "<A-*>", "<C-a>")
vim.keymap.set("c", "<C-a>", "<home>")
vim.keymap.set("c", "<C-b>", "<left>")
vim.keymap.set("c", "<A-?>", "<C-d>")
vim.keymap.set("c", "<C-d>", "<del>")
vim.keymap.set("c", "<C-e>", "<end>")
vim.keymap.set("c", "<C-x><C-e>", "<C-f>")
vim.keymap.set("c", "<C-f>", "<right>")
vim.keymap.set("c", "<A-b>", "<S-left>")
-- buggy when WORD is 1 char long
vim.keymap.set("c", "<A-d>", "<del><S-right><C-w>")
vim.keymap.set("c", "<A-f>", "<S-right>")

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("ClientConfig", {}),
  callback = function(args)
    vim.keymap.set(
      "n",
      "<Leader>ca",
      vim.lsp.buf.code_action,
      { buffer = args.buf }
    )

    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = args.buf })

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = args.buf })

    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = args.buf })

    vim.keymap.set(
      "n",
      "<Leader>gi",
      vim.lsp.buf.implementation,
      { buffer = args.buf }
    )

    vim.keymap.set(
      "n",
      "<Leader>gr",
      vim.lsp.buf.references,
      { buffer = args.buf }
    )

    vim.keymap.set(
      "n",
      "<Leader>rn",
      vim.lsp.buf.rename,
      { buffer = args.buf }
    )

    vim.keymap.set(
      "n",
      "<C-k>",
      vim.lsp.buf.signature_help,
      { buffer = args.buf }
    )

    vim.keymap.set(
      "n",
      "<Leader>wa",
      vim.lsp.buf.add_workspace_folder,
      { buffer = args.buf }
    )

    vim.keymap.set(
      "n",
      "<Leader>wr",
      vim.lsp.buf.remove_workspace_folder,
      { buffer = args.buf }
    )

    vim.keymap.set("n", "<Leader>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workLeader_folders()))
    end, { buffer = args.buf })
  end,
})
