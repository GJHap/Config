return {
   'nvim-neotest/neotest',
   lazy = true,
   keys = {
      {
         '<Leader>tc',
         function()
            require('neotest').run.run()
         end,
         desc = 'Test - Run Current',
      },
      {
         '<Leader>td',
         function()
            require('neotest').run.run({ strategy = 'dap' })
         end,
         desc = 'Test - Debug Current',
      },
      {
         '<Leader>tf',
         function()
            require('neotest').run.run(vim.fn.expand('%'))
         end,
         desc = 'Test - Run File',
      },
      {
         '<Leader>ts',
         function()
            require('neotest').summary.toggle()
         end,
         desc = 'Test - Toggle Summary',
      },
      {
         '<Leader>to',
         function()
            require('neotest').output.open()
         end,
         desc = 'Test - Open Output',
      },
   },
   config = function()
      require('neotest').setup({
         quickfix = {
            enabled = false,
         },
         adapters = {
            require('neotest-jest'),
            require('neotest-vitest'),
         },
      })
   end,
   dependencies = {
      'nvim-neotest/neotest-jest',
      'marilari88/neotest-vitest',
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      require('plugins.treesitter.treesitter'),
   },
}
