return {
   'nvim-treesitter/nvim-treesitter',
   lazy = false,
   build = ':TSUpdate',
   init = function()
      vim.api.nvim_create_autocmd('FileType', {
         callback = function(args)
            local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
            if not lang then
               return
            end

            local config = require('nvim-treesitter.config')
            local installed = config.get_installed('parsers')
            local available = config.get_available()

            if not vim.tbl_contains(installed, lang) and vim.tbl_contains(available, lang) then
               require('nvim-treesitter').install({ lang })
            end

            pcall(vim.treesitter.start)
         end,
      })
   end,
}
