local tree_cb = require 'nvim-tree.config'.nvim_tree_callback

require('nvim-tree').setup {
  -- open_on_setup       = true,
  -- ignore_ft_on_setup  = {'alpha'},
  -- auto_close          = false,
  hijack_netrw        = true,
  open_on_tab         = true,
  update_cwd          = false,
  update_focused_file = {
    enable      = true,
    update_cwd  = true,
    ignore_list = {}
  },
  git                 = {
    ignore = false,
  },
  view                = {
    width = 30,
    side = 'left',
    mappings = {
      custom_only = false,
      list = {
        { key = "t", cb = tree_cb("tabnew") },
        { key = "v", cb = tree_cb("vsplit") },
        { key = "h", cb = tree_cb("dir_up") },
        { key = "l", cb = tree_cb("cd") },
      }
    }
  },
  renderer            = {
    indent_markers = {
      enable = true,
    },
    icons = {
      glyphs = {
        git = {
          unstaged = "",
          staged = "",
          unmerged = "",
          renamed = "➜",
          untracked = "",
          deleted = "",
          ignored = "﯏"
        },
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        }
      }
    }
  }
}
