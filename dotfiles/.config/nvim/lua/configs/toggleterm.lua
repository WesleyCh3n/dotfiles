
require("toggleterm").setup{
  size=10,
  direction = 'horizontal',
  float_opts = {
    border='curved'
  }
}
local Terminal  = require('toggleterm.terminal').Terminal

local function mycmd(cmd)
  return {
    cmd = cmd,
    direction = 'float',
    hidden = true,
  }
end

local lazygit = Terminal:new(mycmd("lazygit"))
local nnn = Terminal:new(mycmd("nnn"))
local bpytop = Terminal:new(mycmd("btop"))
local node = Terminal:new(mycmd("node"))
local python = Terminal:new(mycmd("python3"))

function _lazygit_toggle() lazygit:toggle() end
function _nnn_toggle() nnn:toggle() end
function _bpytop_toggle() bpytop:toggle() end
function _node_toggle() node:toggle() end
function _python_toggle() python:toggle() end
