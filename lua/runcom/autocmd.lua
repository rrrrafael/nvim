local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
autocmd("TextYankPost", {
  group = augroup("YankHighlight", { clear = true }),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      timeout = 50,
      higroup = "Visual",
    })
  end,
})

-- close filetypes with q
autocmd("FileType", {
  group = augroup("FileTypeClose", { clear = true }),
  pattern = {
    "checkhealth",
    "help",
    "lspinfo",
    "man",
    "query",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set(
      "n",
      "q",
      "<cmd>close!<cr>",
      { buffer = event.buf, silent = true }
    )
  end,
})

-- ReadLine command-line editing
local readline = augroup("ReadLine", { clear = true })
autocmd("CmdLineEnter", {
  group = readline,
  callback = function()
    vim.opt_local.iskeyword:append("-")
  end,
})

-- :terminal
autocmd("TermOpen", {
  group = augroup("Terminal", { clear = true }),
  callback = function()
    vim.opt_local.signcolumn = "no"
    vim.opt_local.number = false
    -- vim.cmd("startinsert")
  end,
})
