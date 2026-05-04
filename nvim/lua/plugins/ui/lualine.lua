local function setup()
   local function winbarActive()
      local function is_window_float(window)
         local cfg = vim.api.nvim_win_get_config(window)
         return cfg.relative > '' or cfg.external
      end

      local function is_window_invalid_filetype(window)
         local buffer = vim.api.nvim_win_get_buf(window)
         local ft = vim.api.nvim_get_option_value('filetype', { buf = buffer })

         return ft:match('^oil$') or ft:match('^help$')
      end

      local windows = vim.api.nvim_tabpage_list_wins(vim.api.nvim_get_current_tabpage())
      local window_count = 0

      for _, window in pairs(windows) do
         if not is_window_float(window) and not is_window_invalid_filetype(window) then
            window_count = window_count + 1
         end
      end
      return window_count > 1
   end

   require('lualine').setup({
      options = {
         theme = 'auto',
         globalstatus = true,
      },
      sections = {
         lualine_a = {
            {
               function()
                  local reg = vim.fn.reg_recording()
                  return reg ~= '' and 'recording @' .. reg or ''
               end,
               cond = function()
                  return vim.fn.reg_recording() ~= ''
               end,
               color = 'LualinePeach',
               separator = { right = '', color = 'LualineSepPeach' },
            },
            {
               'mode',
               color = 'LualineMauve',
               separator = { right = '', color = 'LualineSepMauve' },
            },
            {
               'branch',
               color = 'LualineSky',
               separator = { right = '', color = 'LualineSepSky' },
            },
            {
               'diagnostics',
               color = 'LualineMantle',
            },
         },
         lualine_b = {},
         lualine_c = {},
         lualine_x = {},
         lualine_y = {},
         lualine_z = {
            {
               'searchcount',
               color = 'LualinePeach',
               separator = { left = '', color = 'LualineSepPeach' },
            },
            {
               'location',
               color = 'LualineMauve',
               separator = { left = '', color = 'LualineSepMauve' },
            },
            {
               'progress',
               color = 'LualineSky',
               separator = { left = '', color = 'LualineSepSky' },
            },
         },
      },
      winbar = {
         lualine_a = {
            {
               'filename',
               cond = winbarActive,
            },
         },
         lualine_b = {},
         lualine_c = {},
         lualine_x = {},
         lualine_y = {},
         lualine_z = {},
      },
      inactive_winbar = {
         lualine_a = {
            {
               'filename',
               cond = winbarActive,
            },
         },
         lualine_b = {},
         lualine_c = {},
         lualine_x = {},
         lualine_y = {},
         lualine_z = {},
      },
   })
end

return {
   'nvim-lualine/lualine.nvim',
   init = function()
      vim.api.nvim_create_autocmd('User', {
         pattern = 'ThemeUpdated',
         callback = function()
            setup()
         end,
      })
   end,
   config = function()
      setup()
   end,
   dependencies = {
      'echasnovski/mini.nvim',
      require('plugins.catppuccin'),
   },
}
