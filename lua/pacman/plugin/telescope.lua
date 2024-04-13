local telescope = {
  options = function()
    return {
      defaults = {
        layout_strategies = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
          },
        },
        sorting_strategy = "ascending",
        mappings = {
          i = {
            ["<esc>"] = require("telescope.actions").close,
          },
        },
      },
      pickers = {},
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    }
  end,

  keymaps = function()
    vim.keymap.set(
      "n",
      "<leader>t/",
      "<cmd>Telescope current_buffer_fuzzy_find<cr>"
    )
    vim.keymap.set("n", "<leader>tb", "<cmd>Telescope buffers<cr>")
    vim.keymap.set("n", "<leader>td", "<cmd>Telescope diagnostics<cr>")
    vim.keymap.set("n", "<leader>tf", "<cmd>Telescope find_files<cr>")
    vim.keymap.set("n", "<leader>tg", "<cmd>Telescope live_grep<cr>")
    vim.keymap.set("n", "<leader>tm", "<cmd>Telescope man_pages<cr>")
    vim.keymap.set("n", "<leader>tq", "<cmd>Telescope quickfix<cr>")
  end,

  setup = function(opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("fzf")
  end,
}

local lazy = {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      lazy = true,
    },
  },
  opts = telescope.options,
  init = telescope.keymaps,
  config = function(_, opts)
    telescope.setup(opts)
  end,
}

return lazy
