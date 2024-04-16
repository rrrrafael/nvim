local nvim_cmp = {
  options = function()
    return {
      mapping = require("cmp").mapping.preset.insert({
        ["<C-u>"] = require("cmp").mapping.scroll_docs(-4),
        ["<C-d>"] = require("cmp").mapping.scroll_docs(4),
        ["<C-e>"] = require("cmp").mapping.abort(),
        ["<C-y>"] = require("cmp").mapping.confirm({
          behavior = require("cmp").ConfirmBehavior.Insert,
          select = true,
        }),
        ["<C-Space>"] = require("cmp").mapping.complete(),
      }),
      sources = require("cmp").config.sources({
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "buffer" },
      }),
    }
  end,
}

local lazy = {
  "hrsh7th/nvim-cmp",
  lazy = true,
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
  },
  opts = nvim_cmp.options,
}

return lazy
