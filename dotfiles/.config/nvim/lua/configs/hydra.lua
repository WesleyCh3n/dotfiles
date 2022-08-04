local Hydra = require('hydra')

local function cmd(command)
  return table.concat({ '<Cmd>', command, '<CR>' })
end

local hint = [[
            ┌────────────────────────────────────────────┐
  ████████╗ │  _f_ / _b_: files / bufs                       │
  ╚══██╔══╝ │  _g_:  grep                                 │
     ██║    │  _c_: nvim dots         _d_: dots              │
     ██║    │  _/_: search            _?_: search history    │
     ██║    │  _<Space>_: command     _;_: commands history  │
     ╚═╝    │  _<Enter>_: Telescop    _<Esc>_: close         │
            └────────────────────────────────────────────┘
]]

Hydra({
  name = 'Telescope',
  hint = hint,
  config = {
    color = 'teal',
    invoke_on_body = true,
    hint = {
      position = 'middle',
      border = 'rounded',
    },
  },
  mode = 'n',
  body = '<Leader>f',
  heads = {
    { 'f', cmd 'Telescope find_files' },
    { 'b', cmd 'Telescope buffers' },
    { 'g', cmd 'Telescope live_grep' },
    { '/', cmd 'Telescope current_buffer_fuzzy_find' },
    { '<Space>', cmd 'Telescope commands' },
    { '?', cmd 'Telescope search_history' },
    { ';', cmd 'Telescope command_history' },
    { 'c', cmd 'Telescope find_files cwd=~/dotfiles/dotfiles/.config/nvim/lua' },
    { 'd', cmd 'Telescope find_files cwd=~/dotfiles/' },
    { '<Enter>', cmd 'Telescope', { exit = true, desc = 'list all pickers' } },
    { '<Esc>', nil, { exit = true, nowait = true } },
  }
})

Hydra({
  name = "Change / Resize Window",
  mode = { "n" },
  body = "<C-w>",
  heads = {
    -- resizing window
    { "h", "<C-w>3<" },
    { "l", "<C-w>3>" },
    { "k", "<C-w>2+" },
    { "j", "<C-w>2-" },
    -- equalize window sizes
    { "e", "<C-w>=" },
    { "v", "<C-w>v<C-w>h" },
    -- exit this Hydra
    { "<Esc>", nil, { exit = true, nowait = true } },
  },
})
