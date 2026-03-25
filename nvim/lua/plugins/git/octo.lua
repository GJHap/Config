return {
   'pwntester/octo.nvim',
   cmd = 'Octo',
   config = true,
   opts = {
      picker = 'snacks',
      suppress_missing_scope = {
         projects_v2 = true,
      },
   },
   dependencies = {
      'nvim-lua/plenary.nvim',
      'echasnovski/mini.nvim',
   },
}
