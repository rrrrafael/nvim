local nvim_lint = {
  autocmds = function()
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,

  setup = function()
    require("lint").linters_by_ft = {
      c = { "clangtidy" },
      javascript = { "biomejs" },
      json = { "biomejs" },
      php = { "phpcs", "phpstan" },
      python = { "ruff", "pylint" },
      sh = { "shellcheck" },
      typescript = { "biomejs" },
    }
  end,
}

local lazy = {
  "mfussenegger/nvim-lint",
  event = "BufWritePost",
  init = nvim_lint.autocmds,
  config = nvim_lint.setup,
}

return lazy
