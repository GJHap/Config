return {
   'rcarriga/nvim-dap-ui',
   lazy = true,
   keys = {
      {
         '<Leader>du',
         function()
            require('dapui').toggle()
         end,
         desc = 'DAP - Toggle UI',
      },
      {
         '<Leader>ds',
         function()
            require('dapui').float_element('stacks', { enter = true })
         end,
         desc = 'DAP - Stacks',
      },
      {
         '<Leader>dw',
         function()
            require('dapui').float_element('watches', { enter = true })
         end,
         desc = 'DAP - Watches',
      },
      {
         '<Leader>dl',
         function()
            require('dapui').float_element('scopes', { enter = true })
         end,
         desc = 'DAP - Scopes',
      },
      {
         '<Leader>dp',
         function()
            require('dapui').float_element('breakpoints', { enter = true })
         end,
         desc = 'DAP - Breakpoints',
      },
      {
         '<Leader>dr',
         function()
            require('dapui').float_element('repl', { enter = true })
         end,
         desc = 'DAP - Repl',
      },
      {
         '<Leader>dh',
         function()
            require('dapui').eval()
         end,
         desc = 'DAP - Evaluate',
      },
      {
         '<Leader>dh',
         function()
            require('dapui').eval()
         end,
         desc = 'DAP - Evaluate',
         mode = 'v',
      },
   },
   config = true,
   dependencies = { require('plugins.dap.dap') },
}
