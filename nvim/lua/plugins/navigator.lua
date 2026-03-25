return {
   'numToStr/Navigator.nvim',
   lazy = true,
   keys = {
      {
         '<C-h>',
         function()
            require('Navigator').left()
         end,
         desc = 'Navigate Left',
      },
      {
         '<C-j>',
         function()
            require('Navigator').down()
         end,
         desc = 'Navigate Down',
      },
      {
         '<C-k>',
         function()
            require('Navigator').up()
         end,
         desc = 'Navigate Up',
      },
      {
         '<C-l>',
         function()
            require('Navigator').right()
         end,
         desc = 'Navigate Right',
      },
   },
   config = true,
}
