return {
   'stevearc/oil.nvim',
   lazy = true,
   opts = {
      view_options = {
         show_hidden = true,
      },
      float = {
         padding = 2,
         border = 'single',
      },
      confirmation = {
         border = 'single',
      },
   },
   keys = {
      {
         '<Leader>e',
         function()
            require('oil').toggle_float()
         end,
         desc = 'Toggle File Explorer',
      },
   },
   dependencies = { 'echasnovski/mini.nvim' },
}
