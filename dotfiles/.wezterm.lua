local wezterm = require 'wezterm';
local act = wezterm.action

local win_launch_menu = {}
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  table.insert(win_launch_menu, {
    label = "PowerShell",
    args = { "powershell.exe", "-NoLogo" },
  })
  for _, vsvers in ipairs(wezterm.glob("Microsoft Visual Studio/20*", "C:/Program Files (x86)")) do
    local year = vsvers:gsub("Microsoft Visual Studio/", "")
    table.insert(win_launch_menu, {
      label = "x64 Native Tools VS " .. year,
      args = { "cmd.exe", "/k", "C:/Program Files (x86)/" .. vsvers .. "/BuildTools/VC/Auxiliary/Build/vcvars64.bat" },
    })
  end
  local success, wsl_list, wsl_err = wezterm.run_child_process({ "wsl.exe", "-l" })
  wsl_list = wezterm.utf16_to_utf8(wsl_list)
  for idx, line in ipairs(wezterm.split_by_newlines(wsl_list)) do
    if idx > 1 then
      local distro = line:gsub(" %(Default%)", "")
      table.insert(win_launch_menu, {
        label = distro .. " (WSL default shell)",
        args = { "wsl.exe", "--distribution", distro },
      })
      table.insert(win_launch_menu, {
        label = distro .. " (WSL zsh login shell)",
        args = { "wsl.exe", "--distribution", distro, "--exec", "/bin/zsh", "-l" },
      })
    end
  end
end

wezterm.on("toggle-opacity", function(window, pane)
  local overrides = window:get_config_overrides() or {}
  print(overrides.window_background_opacity)
  if overrides.window_background_opacity == 1 then
    overrides.window_background_opacity = 0.85;
  else
    overrides.window_background_opacity = 1;
  end
  window:set_config_overrides(overrides)
end)

wezterm.on("toggle-leader", function(window, pane)
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


local config = {
  harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
  font_size = 14.0,
  window_background_opacity = 0.85,
  color_scheme = "Gruvbox Dark",
  hide_tab_bar_if_only_one_tab = true,
  window_decorations = "RESIZE",
  default_cursor_style = "BlinkingBlock",
  cursor_blink_rate = 800,
}

-- Mac Setup
if wezterm.target_triple == "x86_64-apple-darwin" then
  config["font"] = wezterm.font("VictorMono Nerd Font Mono", { weight = 'Medium' })
  config["font_size"] = 24.0
  config["keys"] = {
    { key = 't', mods = 'CTRL', action = act.EmitEvent "toggle-opacity" },
    { key = ',', mods = 'CTRL', action = act.EmitEvent "toggle-leader" },
  }

  -- Linux Setup
elseif wezterm.target_triple == "x86_64-unknown-linux-gnu" then
  config["font"] = wezterm.font("VictorMono Nerd Font Mono", { weight = 'Medium' })
  config["font_size"] = 14.0
  config["keys"] = {
    { key = 't', mods = 'CTRL', action = act.EmitEvent "toggle-opacity" },
    { key = ',', mods = 'CTRL', action = act.EmitEvent "toggle-leader" },
  }

  -- Win Setup
elseif wezterm.target_triple == "x86_64-pc-windows-msvc" then
  config["launch_menu"] = win_launch_menu
  config["default_prog"] = { "nu.exe" }
  config["font"] = wezterm.font("VictorMono NF")
  config["leader"] = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
  config["keys"] = {
    -- my tmux like config
    -- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
    { key = "a", mods = "LEADER|CTRL", action = act.SendString("\x01") },
    { key = 'x', mods = 'LEADER', action = act.CloseCurrentPane { confirm = true } },

    { key = "v", mods = "LEADER", action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },
    { key = "s", mods = "LEADER", action = act.SplitVertical { domain = "CurrentPaneDomain" } },

    { key = "h", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Left") },
    { key = "l", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Right") },
    { key = "j", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Down") },
    { key = "k", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Up") },

    { key = "p", mods = "LEADER", action = act.ActivateTabRelative(-1) },
    { key = "n", mods = "LEADER", action = act.ActivateTabRelative(1) },

    { key = "LeftArrow", mods = "CTRL|ALT", action = act.MoveTabRelative(-1) },
    { key = "RightArrow", mods = "CTRL|ALT", action = act.MoveTabRelative(1) },

    { key = "1", mods = "CTRL", action = act.ActivateTab(0) },
    { key = "2", mods = "CTRL", action = act.ActivateTab(1) },
    { key = "3", mods = "CTRL", action = act.ActivateTab(2) },
    { key = "4", mods = "CTRL", action = act.ActivateTab(3) },
    { key = "5", mods = "CTRL", action = act.ActivateTab(4) },
    { key = "6", mods = "CTRL", action = act.ActivateTab(5) },
    { key = "7", mods = "CTRL", action = act.ActivateTab(6) },
    { key = "8", mods = "CTRL", action = act.ActivateTab(7) },
    { key = "9", mods = "CTRL", action = act.ActivateTab(8) },

    { key = "z", mods = "LEADER", action = wezterm.action.TogglePaneZoomState },
    { key = "m", mods = "LEADER", action = wezterm.action.ShowLauncher },

    { key = 't', mods = 'CTRL', action = act.EmitEvent "toggle-opacity" },
    { key = ',', mods = 'CTRL', action = act.EmitEvent "toggle-leader" },
  }
end

return config
