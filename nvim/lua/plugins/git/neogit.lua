return {
   'NeogitOrg/neogit',
   lazy = true,
   cmd = 'Neogit',
   keys = {
      { '<leader>gg', '<cmd>Neogit<cr>', desc = 'Show Neogit UI' },
   },
   dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'folke/snacks.nvim',
   },
}
