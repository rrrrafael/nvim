vim.wo.number = true
vim.wo.colorcolumn = "80"
vim.wo.signcolumn = "yes"
vim.o.termguicolors = true

vim.opt.shiftround = true

vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.completeopt = "menuone,noselect"
vim.opt.wildmode = "longest:full,full"

vim.opt.undofile = true
vim.opt.undolevels = 100000
vim.opt.updatetime = 200

vim.o.autoindent = true
vim.o.smartindent = true
vim.o.breakindent = true
vim.opt.formatoptions = "jcroqlnt"

vim.opt.conceallevel = 3
vim.opt.shortmess:append({ I = true })
vim.opt.timeoutlen = 500

vim.opt.autowrite = true
