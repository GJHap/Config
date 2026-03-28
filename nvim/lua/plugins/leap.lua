return {
   'https://codeberg.org/andyg/leap.nvim',
   event = 'BufReadPre',
   keys = {
      { '<Leader>s', '<Plug>(leap)' },
   },
}
