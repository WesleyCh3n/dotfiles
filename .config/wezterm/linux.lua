local wezterm = require 'wezterm';
local act = wezterm.action

local module = {}
function module.apply_to_config(config)
  config["window_decorations"] = "TITLE | RESIZE"
  config["window_background_opacity"] = 1
  config["font"] = wezterm.font("VictorMono NF", { weight = 'Medium' })
  config["font_size"] = 14.0
  config["keys"] = {
    { key = 't', mods = 'CTRL', action = act.EmitEvent "toggle-opacity" },
    { key = ',', mods = 'CTRL', action = act.EmitEvent "toggle-leader" },
  }
end

return module
