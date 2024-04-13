vim.g.netrw_banner = 0
vim.g.netrw_browser_split = 0
vim.g.netrw_fastbrowse = 0
vim.g.netrw_preview = 1
vim.g.netrw_winsize = 20

vim.keymap.set("n", "h", "<Plug>NetrwBrowseUpDir", { buffer = true })
vim.keymap.set("n", "l", "<Plug>NetrwLocalBrowseCheck", { buffer = true })
