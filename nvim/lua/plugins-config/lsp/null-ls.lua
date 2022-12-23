local on_attach = require('plugins-config/lsp/on_attach')
local prequire = require('util').prequire

prequire('null-ls', function(null_ls)
   null_ls.setup({
      sources = {
         null_ls.builtins.formatting.prettier,
         null_ls.builtins.formatting.stylua,
         null_ls.builtins.formatting.nixfmt,
      },
      on_attach = on_attach,
   })
end)
