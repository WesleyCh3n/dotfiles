local wezterm = require 'wezterm';
local act = wezterm.action

local module = {}
function module.apply_to_config(config)
  local win_launch_menu = {}
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
  -- win32_system_backdrop = "Acrylic",
  config["launch_menu"] = win_launch_menu
  config["default_prog"] = { "nu.exe" }
  config["font"] = wezterm.font("VictorMono NFP", { weight = 'Medium' })
  config["leader"] = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
  config["keys"] = {
    -- my tmux like config
    -- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
    { key = "a",          mods = "LEADER|CTRL", action = act.SendString("\x01") },
    { key = 'x',          mods = 'LEADER',      action = act.CloseCurrentPane { confirm = true } },
    { key = "v",          mods = "LEADER",      action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },
    { key = "s",          mods = "LEADER",      action = act.SplitVertical { domain = "CurrentPaneDomain" } },
    { key = "h",          mods = "CTRL|SHIFT",  action = act.ActivatePaneDirection("Left") },
    { key = "l",          mods = "CTRL|SHIFT",  action = act.ActivatePaneDirection("Right") },
    { key = "j",          mods = "CTRL|SHIFT",  action = act.ActivatePaneDirection("Down") },
    { key = "k",          mods = "CTRL|SHIFT",  action = act.ActivatePaneDirection("Up") },
    { key = "p",          mods = "LEADER",      action = act.ActivateTabRelative(-1) },
    { key = "n",          mods = "LEADER",      action = act.ActivateTabRelative(1) },
    { key = "LeftArrow",  mods = "CTRL|ALT",    action = act.MoveTabRelative(-1) },
    { key = "RightArrow", mods = "CTRL|ALT",    action = act.MoveTabRelative(1) },
    { key = "1",          mods = "CTRL",        action = act.ActivateTab(0) },
    { key = "2",          mods = "CTRL",        action = act.ActivateTab(1) },
    { key = "3",          mods = "CTRL",        action = act.ActivateTab(2) },
    { key = "4",          mods = "CTRL",        action = act.ActivateTab(3) },
    { key = "5",          mods = "CTRL",        action = act.ActivateTab(4) },
    { key = "6",          mods = "CTRL",        action = act.ActivateTab(5) },
    { key = "7",          mods = "CTRL",        action = act.ActivateTab(6) },
    { key = "8",          mods = "CTRL",        action = act.ActivateTab(7) },
    { key = "9",          mods = "CTRL",        action = act.ActivateTab(8) },
    { key = "z",          mods = "LEADER",      action = wezterm.action.TogglePaneZoomState },
    { key = "m",          mods = "LEADER",      action = wezterm.action.ShowLauncher },
    { key = 't',          mods = 'CTRL|ALT',    action = act.EmitEvent "toggle-opacity" },
    { key = ',',          mods = 'CTRL',        action = act.EmitEvent "toggle-leader" },
  }
end

return module
