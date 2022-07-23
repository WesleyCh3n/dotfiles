local Hydra = require('hydra')

local function cmd(command)
  return table.concat({ '<Cmd>', command, '<CR>' })
end

local hint = [[
            _f_:  files     _g_:  live grep
  ████████╗ _o_: ﭯ old files _/_:  search in file
  ╚══██╔══╝ _._: dotfiles    _b_: list buffer
     ██║    _h_: vim help    _c_: execute command
     ██║    _k_: keymaps     _;_: commands history
     ██║    _O_: options     _?_: search history
     ╚═╝    _<Enter>_: Telescope            _<Esc>_
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
    { 'g', cmd 'Telescope live_grep' },
    { 'o', cmd 'Telescope oldfiles' },
    { 'h', cmd 'Telescope help_tags' },
    { 'k', cmd 'Telescope keymaps' },
    { 'O', cmd 'Telescope vim_options' },
    { '/', cmd 'Telescope current_buffer_fuzzy_find' },
    { '?', cmd 'Telescope search_history' },
    { ';', cmd 'Telescope command_history' },
    { 'c', cmd 'Telescope commands' },
    { '.', cmd 'Telescope find_files cwd=~/dotfiles/dotfiles/.config/nvim/lua' },
    { 'b', cmd 'Telescope buffers' },
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
    -- exit this Hydra
    { "<Esc>", nil, { exit = true, nowait = true } },
  },
})
