local formatGroup = vim.api.nvim_create_augroup('LspFormatting', {})
local auto_format = function(client, bufnr)
   if client:supports_method('textDocument/formatting') then
      vim.api.nvim_clear_autocmds({ group = formatGroup, buffer = bufnr })
      vim.api.nvim_create_autocmd('BufWritePre', {
         group = formatGroup,
         buffer = bufnr,
         callback = function()
            vim.lsp.buf.format({
               bufnr = bufnr,
               filter = function(client)
                  return client.name == 'efm'
               end,
            })
         end,
      })
   end
end

local attachGroup = vim.api.nvim_create_augroup('lsp-attach', { clear = true })
vim.api.nvim_create_autocmd('LspAttach', {
   group = attachGroup,
   callback = function(event)
      local client = vim.lsp.get_client_by_id(event.data.client_id)
      local bufnr = event.buf

      vim.keymap.set('n', '<Leader>k', function()
         vim.lsp.buf.hover({ border = 'single' })
      end, { buffer = bufnr })
      vim.keymap.set('n', '<Leader>K', function()
         vim.lsp.buf.signature_help({ border = 'single' })
      end, { buffer = bufnr })
      vim.keymap.set('n', '<Leader>rr', vim.lsp.buf.rename, { buffer = bufnr })
      vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, { buffer = bufnr })
      vim.keymap.set('n', '<Leader>df', function()
         vim.diagnostic.open_float({ border = 'single' })
      end, { buffer = bufnr })
      vim.keymap.set('v', '<Leader>ca', vim.lsp.buf.code_action, { buffer = bufnr })

      auto_format(client, bufnr)
   end,
})
