return {
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build =
    'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    lazy = true,
  },
  {
    'nvim-telescope/telescope.nvim',
    opts = function(_, opts)
      if type(opts.extensions) == "table" then
        vim.list_extend(opts.extensions, {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        })
      end
    end,
  }
}
