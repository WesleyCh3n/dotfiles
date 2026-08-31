local wezterm = require 'wezterm';
-- local act = wezterm.action

local module = {}
function module.apply_to_config(config)
  config["font"] = wezterm.font("VictorMono Nerd Font", { weight = 'Medium' })
  config["font_size"] = 18.0
  local keys = {
  }
  for _, value in ipairs(keys) do
    table.insert(config["keys"], value)
  end
  config.macos_window_background_blur = 50
  config.line_height = 1.0
end

return module
