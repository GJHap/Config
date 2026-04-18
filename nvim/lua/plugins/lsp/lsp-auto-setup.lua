return {
   'Massolari/lsp-auto-setup.nvim',
   dependencies = { require('plugins.lsp.lspconfig'), require('plugins.lsp.blink-cmp') },
   init = function()
      vim.lsp.config('*', {
         capabilities = require('blink-cmp').get_lsp_capabilities(),
      })
   end,
   opts = {
      exclude = { 'gitlab_duo' },
   },
   config = true,
}
