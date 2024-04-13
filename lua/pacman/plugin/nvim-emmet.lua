local nvim_emmet = {
  autocmds = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "html", "css" },
      callback = function(event)
        vim.keymap.set(
          { "n", "v" },
          "<leader>em",
          require("nvim-emmet").wrap_with_abbreviation,
          { buffer = event.buf, silent = true }
        )
      end,
    })
  end,
}

local lazy = {
  "olrtg/nvim-emmet",
  lazy = true,
  init = nvim_emmet.autocmds,
}

return lazy
