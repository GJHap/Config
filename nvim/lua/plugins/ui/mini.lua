return {
   'echasnovski/mini.nvim',
   config = function()
      require('mini.icons').setup()
      MiniIcons.mock_nvim_web_devicons()

      require('mini.pairs').setup()

      require('mini.surround').setup()
   end,
}
