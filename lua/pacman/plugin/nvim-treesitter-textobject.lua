return {
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = true,
    opts = {
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            [']c'] = '@class.outer',
            [']f'] = '@call.outer',
            [']m'] = '@function.outer',
            [']o'] = { query = { "@block.outer", "@conditional.outer", "@loop.outer" }, },
          },
          goto_next_end = {
            [']C'] = '@class.outer',
            [']F'] = '@call.outer',
            [']M'] = '@function.outer',
            [']O'] = { query = { "@block.outer", "@conditional.outer", "@loop.outer" }, },
          },
          goto_previous_start = {
            ['[c'] = '@class.outer',
            ['[f'] = '@call.outer',
            ['[m'] = '@function.outer',
            ['[o'] = { query = { "@block.outer", "@conditional.outer", "@loop.outer" }, },
          },
          goto_previous_end = {
            ['[C'] = '@class.outer',
            ['[F'] = '@call.outer',
            ['[M'] = '@function.outer',
            ['[O'] = { query = { "@block.outer", "@conditional.outer", "@loop.outer" }, },
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['<A-t>'] = '@parameter.inner',
          },
          swap_previous = {
            ['<leader><A-t>'] = '@parameter.inner',
          },
        },
      },
    },
    config = function(_, opts)
      local ts_repeat = require("nvim-treesitter.textobjects.repeatable_move")

      vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat.repeat_last_move)
      vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat.repeat_last_move_opposite)

      vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat.builtin_f)
      vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat.builtin_F)
      vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat.builtin_t)
      vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat.builtin_T)

      require("nvim-treesitter.configs").setup(opts)
    end,
  }
}
