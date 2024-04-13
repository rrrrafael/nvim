local nvim_treesitter = {
  options = {
    ensure_installed = {
      "awk",
      "bash",
      "c",
      "disassembly",
      "html",
      "http",
      "javascript",
      "json",
      "jq",
      "lua",
      "markdown",
      "perl",
      "php",
      "python",
      "query",
      "rust",
      "vim",
      "vimdoc",
    },
    sync_install = false,
    auto_install = false,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = false,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-;>",
        node_incremental = "<C-;>",
        scope_incremental = "grc",
        node_decremental = "<C-,>",
      },
    },
  },

  setup = function(opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}

local lazy = {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })()
  end,
  event = "VeryLazy",
  opts = nvim_treesitter.options,
  config = function(_, opts)
    nvim_treesitter.setup(opts)
  end,
}

return lazy
