local keymap = {}

keymap.space = {
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

  c = {'<cmd>cd %:p:h<cr>',                      'which_key_ignore'}, -- change to buf path
  e = {'<cmd>NvimTreeToggle<cr>',                ' file explorer'},
  n = {'<cmd>let @/=""<cr>',                     ' nohl'},
	p = {'<cmd>MarkdownPreviewToggle<cr>',         ' md preview'},
  P = {'<cmd>set paste!<cr>',                    ' toggle paste'},
  l = {'<cmd>Telescope diagnostics bufnr=0<cr>', ' diag'},
  q = {'<cmd>lua CloseBuffer()<cr>',             ' quit'},
  t = {"<cmd>BufferLinePick<cr>",                " pick buf"},
  w = {'<cmd>w<cr>',                             ' write'},
  z = {'<cmd>ZenMode<cr>',                       ' zen'},
  o = {'<cmd>LSoutlineToggle<cr>',               ' outline'},

  a = { name = ' term' },
  ["ag"] = {'<cmd>lua lazygit_toggle()<cr>',      '  lazygit'},
  ["ab"] = {'<cmd>lua top_toggle()<cr>',       '  btop'},
  ["ap"] = {'<cmd>lua python_toggle()<cr>',       '  python'},
  ["as"] = {'<cmd>ToggleTermToggleAll<cr>',        '  toggle all'},
  ["aj"] = {'<cmd>1ToggleTerm<cr>',                '  #1'},
  ["ak"] = {'<cmd>2ToggleTerm<cr>',                '  #2'},
  ["al"] = {'<cmd>3ToggleTerm<cr>',                '  #3'},
  ["a;"] = {'<cmd>ToggleTerm direction=float<cr>', '  #float'},

  f = {name = ' tele-'},
  ["ff"] = {'<cmd>Telescope find_files<cr>',                                          ' files'},
  ["fb"] = {'<cmd>Telescope buffers previewer=false<cr>',                             ' bufs'},
  ["fc"] = {'<cmd>Telescope find_files cwd=~/dotfiles/dotfiles/.config/nvim/lua<cr>', ' nvim dots'},
  ["fd"] = {'<cmd>Telescope find_files cwd=~/dotfiles/<cr>',                          ' dots'},
  ["fe"] = {'<cmd>Telescope symbols<cr>',                                             ' emoji'},
  ["fg"] = {'<cmd>Telescope live_grep<cr>',                                           ' grep'},
  ["ft"] = {'<cmd>TodoTelescope<cr>',                                                 ' Todo'},
  ["f<space>"] = {"<cmd>Telescope commands<cr>",                                      " cmd"},
  ["f<cr>"] = {"<cmd>Telescope<cr>",                                                  "Telescope"},

  r = { name = '漏re-' },
  ["ri"] = {'gg=G<C-o>',        '漏re-Indent'},
  ["rn"] = '漏rename variable',
}

keymap.leader = {
  ["d"] = {name = ' peek'},
  ["dd"] = ' diagnostics',

  g = { name = ' gitsgns' },
  ["gh"] = {'<cmd>Gitsigns preview_hunk<cr>', ' preview hunk'},
  ["gn"] = {'<cmd>Gitsigns next_hunk<cr>',    ' next hunk'},
  ["gp"] = {'<cmd>Gitsigns prev_hunk<cr>',    ' prev hunk'},
  ["gb"] = {'<cmd>Gitsigns blame_line<cr>',   ' blame line'},
  ["gq"] = {'<cmd>Gitsigns setqflist<cr>',    '襁set quickfix list'},

  H = {'<cmd>BufferLineMovePrev<cr>', ' tab move left'},
  L = {'<cmd>BufferLineMoveNext<cr>', ' tab move right'},
  v = {'<cmd>lua Toggle_venn()<cr>', 'toggle venn draw'}
}

return keymap
