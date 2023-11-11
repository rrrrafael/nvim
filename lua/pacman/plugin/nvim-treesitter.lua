return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "VeryLazy",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    opts = {
      ensure_installed = {
        "vim",
        "vimdoc"
      },
      sync_install = false,
      auto_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        cnable = true
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-,>",
          node_incremental = "<C-n>",
          scope_incremental = "grc",
          node_decremental = "<C-p>",
        },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
