vim.cmd.colorscheme("quiet")

vim.opt.number = true
vim.opt.colorcolumn = "80"
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true

vim.opt.shiftround = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.wildmode = "longest:full,full"

vim.opt.undofile = true
vim.opt.undolevels = 100000

vim.opt.updatetime = 200
vim.opt.timeoutlen = 500

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.breakindent = true

vim.opt.conceallevel = 3
vim.opt.shortmess:append({ I = true })

vim.opt.autowrite = true
