local g = vim.g

g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_git_hl = 1

g.nvim_tree_icons = {
  ['git']= {
    ['unstaged']= "",
    ['staged']= "",
    ['unmerged']= "",
    ['renamed']= "➜",
    ['untracked']= "",
    ['deleted']= "",
    ['ignored']= "﯏"
  },
  ['folder']= {
    ['arrow_open']= "",
    ['arrow_closed']= "",
    ['default']= "",
    ['open']= "",
    ['empty']= "",
    ['empty_open']= "",
    ['symlink']= "",
    ['symlink_open']= "",
  }
}

require('nvim-tree').setup {
  open_on_setup       = true,
  ignore_ft_on_setup  = {'alpha'},
  auto_close          = false,
  open_on_tab         = true,
  hijack_cursor       = true,
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
  view = {
    width = 30,
    side = 'left',
    auto_resize = false,
    hide_root_folder = true,
    mappings = {
      custom_only = false,
      list = {}
    }
  }
}
