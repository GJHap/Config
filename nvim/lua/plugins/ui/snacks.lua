return {
   'folke/snacks.nvim',
   priority = 1000,
   keys = {
      {
         '<Leader>bo',
         function()
            Snacks.bufdelete.other()
         end,
         desc = 'Close Other Buffers',
      },
      {
         '<Leader>ba',
         function()
            Snacks.bufdelete.all()
         end,
         desc = 'Close All Buffers',
      },
      {
         '<Leader>bq',
         function()
            Snacks.bufdelete()
         end,
         desc = 'Close Current Buffer',
      },
      {
         '<Leader>ff',
         function()
            Snacks.picker.files()
         end,
         desc = 'Find Files',
      },
      {
         '<Leader>fb',
         function()
            Snacks.picker.buffers()
         end,
         desc = 'Find Buffers',
      },
      {
         '<Leader>fg',
         function()
            Snacks.picker.grep()
         end,
         desc = 'Find Text',
      },
      {
         '<Leader>fk',
         function()
            Snacks.picker.keymaps()
         end,
         desc = 'Find Keymaps',
      },
      {
         '<Leader>fq',
         function()
            Snacks.picker.qflist()
         end,
         desc = 'Find Quickfix',
      },
      {
         '<Leader>ldd',
         function()
            Snacks.picker.lsp_definitions()
         end,
         desc = 'Find Definitions',
      },
      {
         '<Leader>ld-',
         function()
            Snacks.picker.lsp_definitions({ confirm = 'split' })
         end,
         desc = 'Find Definitions (Split Row)',
      },
      {
         '<Leader>ld|',
         function()
            Snacks.picker.lsp_definitions({ confirm = 'vsplit' })
         end,
         desc = 'Find Definitions (Open Column)',
      },
      {
         '<Leader>li',
         function()
            Snacks.picker.lsp_implementations()
         end,
         desc = 'Find Implementations',
      },
      {
         '<Leader>lp',
         function()
            Snacks.picker.diagnostics()
         end,
         desc = 'Find Diagnostic Errors',
      },
      {
         '<Leader>lr',
         function()
            Snacks.picker.lsp_references()
         end,
         desc = 'Find References',
      },
      {
         '<Leader>gB',
         function()
            Snacks.gitbrowse()
         end,
         desc = 'Git Browse',
      },
   },
   opts = {
      input = {},
      notifier = {},
      picker = {},
      indent = {},
      gitbrowse = {},
   },
}
