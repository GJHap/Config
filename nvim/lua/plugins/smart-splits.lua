return {
   'mrjones2014/smart-splits.nvim',
   lazy = false,
   keys = {
      {
         '<C-h>',
         function()
            require('smart-splits').move_cursor_left()
         end,
         desc = 'Navigate Left',
      },
      {
         '<A-h>',
         function()
            require('smart-splits').resize_left()
         end,
         desc = 'Resize Left',
      },
      {
         '<C-j>',
         function()
            require('smart-splits').move_cursor_down()
         end,
         desc = 'Navigate Down',
      },
      {
         '<A-j>',
         function()
            require('smart-splits').resize_down()
         end,
         desc = 'Resize Down',
      },
      {
         '<C-k>',
         function()
            require('smart-splits').move_cursor_up()
         end,
         desc = 'Navigate Up',
      },
      {
         '<A-k>',
         function()
            require('smart-splits').resize_up()
         end,
         desc = 'Resize Up',
      },
      {
         '<C-l>',
         function()
            require('smart-splits').move_cursor_right()
         end,
         desc = 'Navigate Right',
      },
      {
         '<A-l>',
         function()
            require('smart-splits').resize_right()
         end,
         desc = 'Resize Right',
      },
   },
   config = true,
}
