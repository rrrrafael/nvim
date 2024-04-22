local conform = {
  options = {
    formatters_by_ft = {
      c = { "clang-format" },
      css = { "prettier" },
      html = { "prettier" },
      javascript = { "biome" },
      json = { "biome" },
      lua = { "stylua" },
      markdown = { "prettier" },
      php = { { "prettier", "php-cs-fixer" } },
      python = { "ruff_fix", "ruff_format" },
      rust = { "rustfmt" },
      sh = { "shfmt" },
      typescript = { "biome" },
    },
    formaters = {
      injected = {
        options = {
          lang_to_ext = {},
          lang_to_formatters = {},
        },
      },
      prettier = {
        options = {
          ft_parsers = {
            css = "css",
            html = "html",
            markdown = "markdown",
            php = "php",
          },
        },
      },
      shfmt = {},
    },
  },

  autocmds = function()
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        require("conform").format({ bufnr = args.buf })
        if vim.bo[args.buf].filetype == "html" then
          vim.cmd("mark z | %s: />:>:g | 'z")
        end
      end,
      desc = "Conform.nvim formatting",
    })
  end,

  user_commands = function()
    vim.o.formatexpr = "v:lua.require('conform').formatexpr()"

    vim.api.nvim_create_user_command("Format", function(args)
      local range = nil
      if args.count ~= -1 then
        local end_line =
          vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
          start = { args.line1, 0 },
          ["end"] = { args.line2, end_line:len() },
        }
      end
      require("conform").format({
        async = true,
        lsp_fallback = true,
        range = range,
      })
    end, { range = true })
  end,
}

local lazy = {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  cmd = "ConformInfo",
  opts = conform.options,
  init = function()
    conform.autocmds()
    conform.user_commands()
  end,
}

return lazy
