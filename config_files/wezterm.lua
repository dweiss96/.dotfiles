local wezterm = require 'wezterm'

return {
  color_scheme = "Catppuccin Mocha",
  audible_bell = "Disabled",
  font = wezterm.font('Fira Code', { weight = 'DemiBold' }),
  font_size = 14.0,
  keys = {
    -- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
    {key="LeftArrow", mods="OPT", action=wezterm.action{SendString="\x1bb"}},
    -- Make Option-Right equivalent to Alt-f; forward-word
    {key="RightArrow", mods="OPT", action=wezterm.action{SendString="\x1bf"}},
  }
}
