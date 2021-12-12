
require("which-key").setup {
  key_labels = {
    ["<space>"] = "SPC",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "", -- symbol used between a key and it's label
    group = " ", -- symbol prepended to a group
  },
  window = {
    border = "single", -- none, single, double, shadow
  },
  layout = {
    height = { min = 4, max = 20 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 5, -- spacing between columns
    align = "center", -- align columns left, center or right
  },
}

local wk = require("which-key")
wk.register({
  ['#'] = 'ﴵ tab #[123]',
  ['1'] = 'which_key_ignore',
  ['2'] = 'which_key_ignore',
  ['3'] = 'which_key_ignore',
  ['4'] = 'which_key_ignore',
  ['5'] = 'which_key_ignore',
  ['6'] = 'which_key_ignore',
  ['7'] = 'which_key_ignore',
  ['8'] = 'which_key_ignore',
  ['9'] = 'which_key_ignore',
  a = {
    name = ' float',
    s = ' shell',
    g = ' lazygit',
    d = ' lazydocker',
    b = ' btop',
    n = ' nnn',
    j = ' node',
    p = ' python',
  },
  c = 'which_key_ignore',
  d = { name = 'which_key_ignore' },
  e = ' nnn',
  f = {
    name = ' telescope',
    b = ' list buffers',
    c = ' nvimrc',
    d = ' dotfile',
    f = ' find files',
    g = ' GitHub',
    w = ' rm trailing white',
  },
  l = ' diagnostics list',
  p = ' md preview',
  P = ' toggle paste',
  q = ' quit',
  r = {
    name = '漏re-',
    i = '漏re-Indent',
    t = '漏re-Tab',
    n = '漏rename variable'
  },
  s = { name = 'which_key_ignore' },
  t = ' toggle bg',
  w = ' write',
  z = ' zen',
}, { prefix = "<space>" })

wk.register({
  g = {
    d = ' show definitions',
    r = ' show reference',
  }
})

wk.register({
  ['>'] = 'which_key_ignore', -- ' tab move right',
  ['<'] = 'which_key_ignore', -- ' tab move left',
  f = ' hopWord',
  l = ' hopLineStart',
  n = ' no Highlight',
  o = ' outline',
  r = ' toggle repl',
  s = '﯒ find replace',
  w = ' send repl',
  c = { name = '# comment' },
  d = {
    name = ' peek def',
    f = ' def whole',
    F = ' def single',
  },
}, { prefix = "<leader>" })

vim.cmd[[ hi WhichKeyFloat ctermbg=BLACK ctermfg=BLACK ]]
