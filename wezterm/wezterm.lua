local wezterm = require('wezterm')

local catppuccin_flavor_file = os.getenv('HOME') .. '/.local/state/catppuccin-flavor'
wezterm.add_to_config_reload_watch_list(catppuccin_flavor_file)

local function get_color_scheme()
   local flavor = 'mocha'
   local f = io.open(catppuccin_flavor_file, 'r')
   if f then
      flavor = f:read('*all'):gsub('%s+', '')
      f:close()
   end
   return 'Catppuccin ' .. flavor:gsub('^%l', string.upper)
end

return {
   color_scheme = get_color_scheme(),
   disable_default_key_bindings = true,
   font = wezterm.font('JetBrainsMono Nerd Font'),
   font_size = 13.0,
   front_end = 'WebGpu',
   hide_tab_bar_if_only_one_tab = true,
   keys = {
      { key = 'c', mods = 'SUPER', action = wezterm.action.CopyTo('Clipboard') },
      { key = 'v', mods = 'SUPER', action = wezterm.action.PasteFrom('Clipboard') },
      { key = 'c', mods = 'CTRL|SHIFT', action = wezterm.action.CopyTo('Clipboard') },
      { key = 'v', mods = 'CTRL|SHIFT', action = wezterm.action.PasteFrom('Clipboard') },
   },
}
