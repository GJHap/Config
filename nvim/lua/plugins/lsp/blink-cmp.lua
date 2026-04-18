return {
   'saghen/blink.cmp',
   version = '1.*',
   opts = {
      keymap = {
         preset = 'default',
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
         accept = {
            auto_brackets = {
               enabled = true,
               semantic_token_resolution = { enabled = false },
            },
         },
         menu = { border = 'single' },
         documentation = { auto_show = true, window = { border = 'single' } },
      },
      cmdline = {
         enabled = true,
      },
   },
}
