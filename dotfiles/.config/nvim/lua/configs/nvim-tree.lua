local g = vim.g

g.nvim_tree_indent_markers = 1
g.nvim_tree_git_hl = 0

g.nvim_tree_icons = {
  ['git']            = {
    ['unstaged']     = "",
    ['staged']       = "",
    ['unmerged']     = "",
    ['renamed']      = "➜",
    ['untracked']    = "",
    ['deleted']      = "",
    ['ignored']      = "﯏"
  },
  ['folder']         = {
    ['arrow_open']   = "",
    ['arrow_closed'] = "",
    ['default']      = "",
    ['open']         = "",
    ['empty']        = "",
    ['empty_open']   = "",
    ['symlink']      = "",
    ['symlink_open'] = "",
  },
}

local tree_cb = require'nvim-tree.config'.nvim_tree_callback

require('nvim-tree').setup {
  open_on_setup       = true,
  ignore_ft_on_setup  = {'alpha'},
  auto_close          = false,
  open_on_tab         = true,
  update_cwd          = false,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable      = true,
    update_cwd  = true,
    ignore_list = {}
  },
  git = {
    ignore = false,
  },
  view = {
    width = 30,
    side = 'left',
    auto_resize = false,
    hide_root_folder = true,
    mappings = {
      custom_only = false,
      list = {
        { key = "t", cb = tree_cb("tabnew") },
        { key = "v", cb = tree_cb("vsplit") },
        { key = "h", cb = tree_cb("dir_up") },
        { key = "l", cb = tree_cb("cd") },
      }
    }
  }
}
