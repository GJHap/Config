local wezterm = require('wezterm')

local catppuccin_flavor_file = os.getenv('HOME') .. '/.local/state/catppuccin-flavor'
wezterm.add_to_config_reload_watch_list(catppuccin_flavor_file)

local function get_color_scheme()
   local function get_flavor()
      local flavor = 'mocha'

      local f = io.open(catppuccin_flavor_file, 'r')
      if f then
         flavor = f:read('*all'):gsub('%s+', '')
         f:close()
      end

      return flavor
   end

   return 'Catppuccin ' .. (get_flavor():gsub('^%l', string.upper))
end

return {
   color_scheme = get_color_scheme(),
   disable_default_key_bindings = true,
   font = wezterm.font('JetBrainsMono Nerd Font'),
   front_end = 'WebGpu',
   hide_tab_bar_if_only_one_tab = true,
   keys = {
      {
         key = 'v',
         mods = 'CTRL|SHIFT',
         action = wezterm.action.PasteFrom('Clipboard'),
      },
   },
}
