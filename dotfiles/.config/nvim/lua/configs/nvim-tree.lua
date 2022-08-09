local tree_cb = require 'nvim-tree.config'.nvim_tree_callback

-- write/close file
function _G.CloseBuffer()
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

require('nvim-tree').setup {
  diagnostics = {
    enable = true,
  },
  hijack_netrw        = true,
  open_on_tab         = true,
  update_cwd          = false,
  update_focused_file = {
    enable      = true,
    update_root = true,
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
