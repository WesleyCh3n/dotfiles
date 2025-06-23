local wezterm = require 'wezterm';
local opacity = 0.5

wezterm.on("toggle-opacity", function(window, _)
  local overrides = window:get_config_overrides() or {}
  print(overrides.window_background_opacity)
  if overrides.window_background_opacity == 1 then
    overrides.window_background_opacity = opacity;
  else
    overrides.window_background_opacity = 1;
  end
  window:set_config_overrides(overrides)
end)

wezterm.on("toggle-leader", function(window, _)
  local overrides = window:get_config_overrides() or {}
  if not overrides.leader then
    window:toast_notification('wezterm', 'Change wezterm leader to ctrl+b', nil, 0)
    overrides.leader = { key = "b", mods = "CTRL" }
  else
    window:toast_notification('wezterm', 'Change wezterm leader to ctrl+a', nil, 0)
    overrides.leader = nil
  end
  window:set_config_overrides(overrides)
end)
