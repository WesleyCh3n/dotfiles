local wezterm = require 'wezterm';
local act = wezterm.action

local module = {}
function module.apply_to_config(config)
  config["font"] = wezterm.font("VictorMono Nerd Font", { weight = 'Medium' })
  config["font_size"] = 19.0
  local keys = {
    { key = 't', mods = 'CTRL', action = act.EmitEvent "toggle-opacity" },
    { key = ',', mods = 'CTRL', action = act.EmitEvent "toggle-leader" },
  }
  for _, value in ipairs(keys) do
    table.insert(config["keys"], value)
  end
  config.macos_window_background_blur = 45
  config.line_height = 1
end

return module
