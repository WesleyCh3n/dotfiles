
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
    margin = {0, 0, 0, 0},
  },
  layout = {
    height = { min = 4, max = 20 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 5, -- spacing between columns
    align = "center", -- align columns left, center or right
  },
}

-- write/close file
function CloseBuffer()
  local treeView = require('nvim-tree.view')
  local bufferline = require('bufferline')
  local explorerWindow = treeView.get_winnr()
  if explorerWindow == nil then
    vim.cmd('bdelete! ')
    return
  end
  local wasExplorerOpen = vim.api.nvim_win_is_valid(explorerWindow)
  local bufferToDelete = vim.api.nvim_get_current_buf()
  if (wasExplorerOpen) then
    bufferline.cycle(-1)
  end
  vim.cmd('bdelete! ' .. bufferToDelete)
end

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
    name = ' term',
    g = {'<cmd>lua _lazygit_toggle()<cr>',          '  lazygit'},
    b = {'<cmd>lua _bpytop_toggle()<cr>',           '  btop'},
    p = {'<cmd>lua _python_toggle()<cr>',           '  python'},
    s = {'<cmd>ToggleTermToggleAll<cr>',            '  toggle all'},
    j = {'<cmd>1ToggleTerm<cr>',                    '  #1'},
    k = {'<cmd>2ToggleTerm<cr>',                    '  #2'},
    l = {'<cmd>3ToggleTerm<cr>',                    '  #3'},
    [";"] = {'<cmd>ToggleTerm direction=float<cr>', '  #float'},
  },
  c = {'<cmd>cd %:p:h<cr>',       'which_key_ignore'}, -- change to buf path
  e = {'<cmd>NvimTreeToggle<cr>', ' file explorer'},
  f = {
    name = ' tele-',
    f = {'<cmd>Telescope find_files<cr>',                                          ' files'},
    b = {'<cmd>Telescope buffers previewer=false<cr>',                             ' bufs'},
    c = {'<cmd>Telescope find_files cwd=~/dotfiles/dotfiles/.config/nvim/lua<cr>', ' nvim dots'},
    d = {'<cmd>Telescope find_files cwd=~/dotfiles/<cr>',                          ' dots'},
    e = {'<cmd>Telescope symbols<cr>',                                             ' emoji'},
    g = {'<cmd>Telescope live_grep<cr>',                                           ' grep'},
    t = {'<cmd>TodoTelescope<cr>',                                                 ' Todo'},
    ["<space>"] = {"<cmd>Telescope commands<cr>",                                  " cmd"},
    ["<cr>"] = {"<cmd>Telescope<cr>",                                              "Telescope"}
  },
  n = {'<cmd>let @/=""<cr>',                     ' nohl'},
	p = {'<cmd>MarkdownPreviewToggle<cr>',         ' md preview'},
  P = {'<cmd>set paste!<cr>',                    ' toggle paste'},
  l = {'<cmd>Telescope diagnostics bufnr=0<cr>', ' diag'},
  q = {'<cmd>lua CloseBuffer()<cr>',             ' quit'},
  r = {
    name = '漏re-',
    i = {'gg=G<C-o>', '漏re-Indent'},
    n = '漏rename variable',
    w = {'<cmd>let _s=@/<Bar>:%s/\\s\\+$//e<Bar>:let @/=_s<Bar>:nohl <Bar>:unlet _s <CR>', ' rm trailing white'},
  },
  t = {"<cmd>BufferLinePick<cr>",  " pick buf"},
  w = {'<cmd>w<cr>',               ' write'},
  z = {'<cmd>ZenMode<cr>',         ' zen'},
  o = {'<cmd>LSoutlineToggle<cr>', ' outline'},
}, { prefix = "<space>" })

wk.register({
  d = {
    name = ' peek',
    d = ' diagnostics',
  },
  g = {
    name = ' gitsgns',
    h = {'<cmd>Gitsigns preview_hunk<cr>', ' preview hunk'},
    n = {'<cmd>Gitsigns next_hunk<cr>',    ' next hunk'},
    p = {'<cmd>Gitsigns prev_hunk<cr>',    ' prev hunk'},
    b = {'<cmd>Gitsigns blame_line<cr>',   ' blame line'},
    q = {'<cmd>Gitsigns setqflist<cr>',    '襁set quickfix list'},
  },
  H = {'<cmd>BufferLineMoveNext<cr>', ' tab move left'},
  L = {'<cmd>BufferLineMovePrev<cr>', ' tab move right'},
  v = {'<cmd>lua Toggle_venn()<cr>', 'toggle venn draw'}
}, { prefix = "<leader>" })
