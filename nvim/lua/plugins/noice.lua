return {
   'folke/noice.nvim',
   config = true,
   init = function()
      vim.o.cmdheight = 0
   end,
   opts = {
      lsp = {
         signature = {
            enabled = false,
         },
         progress = {
            enabled = false,
         },
         hover = {
            enabled = false,
         },
         override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            ['vim.lsp.util.stylize_markdown'] = true,
         },
      },
      presets = {
         bottom_search = true,
         command_palette = true,
         long_message_to_split = true,
      },
      routes = {
         {
            filter = {
               event = 'msg_show',
               kind = '',
            },
            opts = { skip = true },
         },
         {
            filter = {
               event = 'msg_show',
               kind = 'search_count',
            },
            opts = { skip = true },
         },
         {
            filter = {
               warning = true,
            },
            opts = { skip = true },
         },
      },
   },
   dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
   },
}