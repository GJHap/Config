local util = require('util')
local nnoremap = util.nnoremap
local vnoremap = util.vnoremap

local attachGroup = vim.api.nvim_create_augroup('lsp-attach', { clear = true })
vim.api.nvim_create_autocmd('LspAttach', {
   group = attachGroup,
   callback = function(event)
      local bufnr = event.buf

      nnoremap('<Leader>k', function()
         vim.lsp.buf.hover({ border = 'single' })
      end, {
         buffer = bufnr,
         desc = 'Hover Documentation',
      })

      nnoremap('<Leader>r', vim.lsp.buf.rename, { buffer = bufnr, desc = 'Rename' })

      nnoremap('<Leader>ca', vim.lsp.buf.code_action, { buffer = bufnr, desc = 'Code Actions' })
      vnoremap('<Leader>ca', vim.lsp.buf.code_action, { buffer = bufnr, desc = 'Code Actions (Range)' })

      nnoremap('<Leader>df', function()
         vim.diagnostic.open_float({ border = 'single' })
      end, {
         buffer = bufnr,
         desc = 'Open Diagnostics',
      })
   end,
})
