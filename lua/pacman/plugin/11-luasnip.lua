local luasnip = {
  options = { history = true },

  keymaps = function()
    vim.keymap.set({ "i", "s" }, "<A-ç>", function()
      if require("luasnip").expand_or_jumpable() then
        require("luasnip").expand_or_jump()
      end
    end)

    vim.keymap.set({ "i", "s" }, "<A-j>", function()
      if require("luasnip").jumpable() then
        require("luasnip").jump(-1)
      end
    end)

    vim.keymap.set("i", "<A-k>", function()
      if require("luasnip").choice_active() then
        require("luasnip").change_choice()
      end
    end)
  end,

  snippets = function()
    vim.tbl_map(function(type)
      require("luasnip.loaders.from_" .. type).lazy_load()
    end, { "vscode", "snipmate", "lua" })

    require("luasnip").filetype_extend("python", { "pydoc" })
    require("luasnip").filetype_extend("php", { "php", "phpdoc" })
  end,

  nvim_cmp = {
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    sources = function(opts)
      table.insert(opts.sources, { name = "luasnip" })
    end,
  },
}

local lazy = {
  "L3MON4D3/LuaSnip",
  build = "make install_jsregexp",
  event = "InsertEnter",
  dependencies = {
    { "rafamadriz/friendly-snippets" },
    {
      "hrsh7th/nvim-cmp",
      dependencies = {
        "saadparwaiz1/cmp_luasnip",
      },
      opts = function(_, opts)
        opts.snippet = luasnip.nvim_cmp.snippet
        luasnip.nvim_cmp.sources(opts)
      end,
    },
  },
  opts = luasnip.options,
  init = luasnip.keymaps,
  config = function()
    luasnip.snippets()
  end,
}

return lazy
