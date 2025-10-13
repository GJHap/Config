return {
   'ggandor/leap.nvim',
   event = 'BufReadPre',
   init = function()
      local nnoremap = require('util').nnoremap
      nnoremap('s', '<Plug>(leap)')
   end,
}
