return {
   'stevearc/conform.nvim',
   event = 'BufWritePre',
   opts = {
      format_on_save = {
         timeout_ms = 2000,
      },
      formatters_by_ft = {
         css = { 'prettier' },
         go = { 'gofmt' },
         graphql = { 'prettier' },
         html = { 'prettier' },
         javascript = { 'prettier' },
         javascriptreact = { 'prettier' },
         json = { 'prettier' },
         lua = { 'stylua' },
         markdown = { 'prettier' },
         nix = { 'nixfmt' },
         scss = { 'prettier' },
         typescript = { 'prettier' },
         typescriptreact = { 'prettier' },
         yaml = { 'prettier' },
      },
   },
}
