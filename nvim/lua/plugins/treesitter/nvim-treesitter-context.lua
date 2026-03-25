return {
   'nvim-treesitter/nvim-treesitter-context',
   event = 'BufReadPre',
   config = true,
   dependencies = {
      require('plugins.treesitter.treesitter'),
   },
}
