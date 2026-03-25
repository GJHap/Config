return {
   'windwp/nvim-ts-autotag',
   event = 'BufReadPre',
   config = true,
   dependencies = {
      require('plugins.treesitter.treesitter'),
   },
}
