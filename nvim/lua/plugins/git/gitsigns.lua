return {
   'lewis6991/gitsigns.nvim',
   lazy = true,
   event = 'BufReadPre',
   opts = {
      on_attach = function(bufnr)
         local gitsigns = package.loaded.gitsigns
         local opts = { buffer = bufnr }

         local nnoremap = require('util').nnoremap
         nnoremap(']h', function()
            if vim.wo.diff then
               vim.cmd.normal({ ']c', bang = true })
            else
               gitsigns.next_hunk()
            end
         end, vim.tbl_extend('force', opts, { desc = 'Next Hunk' }))

         nnoremap('[h', function()
            if vim.wo.diff then
               vim.cmd.normal({ '[c', bang = true })
            else
               gitsigns.prev_hunk()
            end
         end, vim.tbl_extend('force', opts, { desc = 'Prev Hunk' }))

         nnoremap('<Leader>hs', gitsigns.stage_hunk, vim.tbl_extend('force', opts, { desc = 'Stage Hunk' }))
         nnoremap('<Leader>hr', gitsigns.reset_hunk, vim.tbl_extend('force', opts, { desc = 'Reset Hunk' }))
         nnoremap(
            '<Leader>hp',
            gitsigns.preview_hunk_inline,
            vim.tbl_extend('force', opts, { desc = 'Preview Hunk Inline' })
         )
      end,
   },
}
