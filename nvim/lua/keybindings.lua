local util = require('util')

local function buffer()
   util.nnoremap('<Leader>bl', ':bn <CR>')
   util.nnoremap('<Leader>bh', ':bp <CR>')
   util.nnoremap('<Leader>bq', ':bd <CR>')
   util.nnoremap('<Leader>bqo', ':%bd|e#|bd# <CR>')
   util.nnoremap('<Leader>bqa', ':%bd <CR>')
   util.nnoremap('<Leader>bsc', ':vsplit <CR>')
   util.nnoremap('<Leader>bsr', ':split <CR>')
end

local function git()
   util.nnoremap('<Leader>ga', ':Git add .<CR>')
   util.nnoremap('<Leader>gs', ':Git status <CR>')
   util.nnoremap('<Leader>gb', ':Git blame <CR>')
   util.nnoremap('<Leader>gl', ':Git log <CR>')
   util.nnoremap('<Leader>gpl', ':Git pull <CR>')
   util.nnoremap('<Leader>gps', ':Git push <CR>')
   util.nnoremap('<Leader>gc', ':Git commit <CR>')
end

local function move_line()
   util.inoremap('<A-j>', '<Esc>:m .+1<CR>==gi')
   util.nnoremap('<A-j>', ':m .+1<CR>==')
   util.vnoremap('<A-j>', ":m '>+1<CR>gv=gv")
   util.inoremap('<A-k>', '<Esc>:m .-2<CR>==gi')
   util.nnoremap('<A-k>', ':m .-2<CR>==')
   util.vnoremap('<A-k>', ":m '<-2<CR>gv=gv")
end

local function tab()
   util.nnoremap('<Leader>tl', ':tabnext <CR>')
   util.nnoremap('<Leader>th', ':tabprevious <CR>')
   util.nnoremap('<Leader>ta', ':tabnew <CR>')
   util.nnoremap('<Leader>tq', ':tabclose <CR>')
end

buffer()
git()
move_line()
tab()
