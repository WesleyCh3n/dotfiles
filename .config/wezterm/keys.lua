local wezterm = require 'wezterm';
local act = wezterm.action

local keys = {
  { key = 't', mods = 'CTRL|ALT', action = act.EmitEvent "toggle-opacity" },
  { key = ',', mods = 'CTRL',     action = act.EmitEvent "toggle-leader" },
  {
    key = 'x',
    mods = 'LEADER',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  {
    key = "o",
    mods = "LEADER",
    action = wezterm.action { PaneSelect = {} }
  },
  {
    key = 'LeftArrow',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key = 'RightArrow',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  {
    key = 'UpArrow',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key = 'DownArrow',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },
  { key = 's', mods = 'LEADER|CTRL', action = wezterm.action.SendKey { key = 's', mods = 'CTRL' } },
  { key = 'v', mods = 'LEADER',      action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = 's', mods = 'LEADER',      action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = 'p', mods = 'LEADER',      action = act.ActivateTabRelative(-1) },
  { key = 'p', mods = 'LEADER|CTRL', action = act.ActivateTabRelative(-1) },
  { key = 'n', mods = 'LEADER',      action = act.ActivateTabRelative(1) },
  { key = 'n', mods = 'LEADER|CTRL', action = act.ActivateTabRelative(1) },
  { key = 'c', mods = 'LEADER',      action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 'c', mods = 'LEADER|CTRL', action = act.SpawnTab 'CurrentPaneDomain' },
}

for i = 1, 8 do
  table.insert(keys, {
    key = tostring(i),
    mods = 'LEADER',
    action = act.ActivateTab(i - 1),
  })
end
return keys
