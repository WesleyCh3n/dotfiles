local wezterm = require 'wezterm';

require("events")

local config = {
  font_size = 11.0,
  window_background_opacity = 0.5,
  color_scheme = "GruvboxDark",
  hide_tab_bar_if_only_one_tab = true,
  window_decorations = "RESIZE",
  default_cursor_style = "BlinkingBlock",
  cursor_blink_rate = 800,
  leader = { key = 's', mods = 'CTRL', timeout_milliseconds = 1000 },
  keys = require("keys")
}

if wezterm.target_triple == "x86_64-apple-darwin" or wezterm.target_triple == "aarch64-apple-darwin" then
  require("mac").apply_to_config(config)
elseif wezterm.target_triple == "x86_64-unknown-linux-gnu" then
  require("linux").apply_to_config(config)
elseif wezterm.target_triple == "x86_64-pc-windows-msvc" then
  require("win").apply_to_config(config)
end

return config
