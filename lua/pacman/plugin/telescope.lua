return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    cmd = "Telescope",
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzf-native.nvim',
    },
    opts = {
      defaults = {
        layout_strategies = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            height = { padding = 0 },
            width = { padding = 0 },
            preview_width = 0.5,
          },
        },
        path_display = {
          -- shorten = 4,
        },
        sorting_strategy = "ascending",
        borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
        mappings = {},
      },
      pickers = {},
      extensions = {},
    },
    config = function(_, opts)
      if type(opts.defaults.mappings) == "table" then
        opts.defaults.mappings = vim.tbl_deep_extend(
        "force",
        opts.defaults.mappings or {},
        {
          i = {
            ["<esc>"] = require('telescope.actions').close,
          },
        })
      end

      require("telescope").setup(opts)
      require("telescope").load_extension("fzf")
    end,
  },
}
