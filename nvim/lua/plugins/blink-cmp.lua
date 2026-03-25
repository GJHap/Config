return {
   'saghen/blink.cmp',
   lazy = true,
   event = 'BufReadPre',
   version = '1.*',
   opts = {
      keymap = {
         preset = 'none',
         ['<C-Space>'] = { 'show', 'fallback' },
         ['<C-e>'] = { 'hide', 'fallback' },
         ['<CR>'] = { 'accept', 'fallback' },
         ['<Tab>'] = { 'select_next', 'fallback' },
         ['<S-Tab>'] = { 'select_prev', 'fallback' },
         ['<C-d>'] = {
            function(cmp)
               if cmp.is_visible() then
                  for _ = 1, 10 do
                     cmp.select_next()
                  end
                  return true
               end
            end,
            'fallback',
         },
         ['<C-u>'] = {
            function(cmp)
               if cmp.is_visible() then
                  for _ = 1, 10 do
                     cmp.select_prev()
                  end
                  return true
               end
            end,
            'fallback',
         },
      },
      sources = {
         default = { 'lsp', 'buffer' },
      },
      completion = {
         list = {
            selection = {
               preselect = true,
               auto_insert = false,
            },
         },
         menu = { border = 'single' },
         documentation = { auto_show = true, window = { border = 'single' } },
      },
   },
}
