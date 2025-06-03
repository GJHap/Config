return {
   'pwntester/octo.nvim',
   config = true,
   opts = {
      suppress_missing_scope = {
         projects_v2 = true,
      },
   },
   dependencies = {
      'nvim-lua/plenary.nvim',
      require('plugins.ui.telescope'),
      'kyazdani42/nvim-web-devicons',
   },
}
