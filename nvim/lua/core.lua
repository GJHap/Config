vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.fillchars = { fold = ' ', foldopen = '', foldclose = '' }
vim.opt.foldcolumn = '1'
vim.opt.foldexpr = 'v:lua.vim.lsp.foldexpr()'
vim.opt.foldmethod = 'expr'
vim.opt.foldtext = 'getline(v:foldstart)'
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 3
vim.opt.showmode = false
vim.opt.softtabstop = 3
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.cmdheight = 0

vim.g.mapleader = ' '

local nnoremap = require('util').nnoremap
local vnoremap = require('util').vnoremap

nnoremap('<Leader>|', ':vsplit <CR>', { desc = 'Split Column' })
nnoremap('<Leader>-', ':split <CR>', { desc = 'Split Row' })
nnoremap('<Leader>cl', ':normal gcc<CR>', { desc = 'Comment Current Line' })
vnoremap('<Leader>cl', ':normal gcc<CR>', { desc = 'Comment Range' })
nnoremap('<Leader>hq', ':nohlsearch <CR>', { desc = 'Disable Search Highlight' })
