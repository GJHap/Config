local function get_flavor()
   local flavor = 'mocha'

   local catppuccin_flavor_file = os.getenv('HOME') .. '/.local/state/catppuccin-flavor'
   local f = io.open(catppuccin_flavor_file, 'r')
   if f then
      flavor = f:read('*all'):gsub('%s+', '')
      f:close()
   end

   return flavor
end

return {
   'catppuccin/nvim',
   name = 'catppuccin',
   priority = 1000,
   init = function()
      local signal_group = vim.api.nvim_create_augroup('ThemeSignal', { clear = true })
      vim.api.nvim_create_autocmd('Signal', {
         group = signal_group,
         pattern = 'SIGUSR1',
         callback = function()
            require('catppuccin').load(get_flavor())

            ---@diagnostic disable-next-line: param-type-mismatch
            vim.api.nvim_exec_autocmds('User', { pattern = 'ThemeUpdated' })
         end,
      })
   end,
   config = function()
      require('catppuccin').setup({
         flavour = get_flavor(),
         auto_integrations = true,
         custom_highlights = function(colors)
            return {
               LualinePeach = { fg = colors.base, bg = colors.peach },
               LualineSepPeach = { fg = colors.peach, bg = 'none' },

               LualineMauve = { fg = colors.base, bg = colors.mauve },
               LualineSepMauve = { fg = colors.mauve, bg = 'none' },

               LualineSky = { fg = colors.base, bg = colors.sky },
               LualineSepSky = { fg = colors.sky, bg = 'none' },

               LualineSurface = { fg = colors.text, bg = colors.surface2 },
               LualineSepSurface = { fg = colors.surface2, bg = 'none' },
            }
         end,
      })

      vim.cmd.colorscheme('catppuccin-nvim')
   end,
}
