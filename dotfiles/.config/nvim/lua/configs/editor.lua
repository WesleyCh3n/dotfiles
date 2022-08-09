local config = {}

config = {
  leap = function ()
    require('leap').set_default_keymaps()
  end,

  targets = function ()
    vim.g.targets_aiAI = 'aIAi'
  end,

  ["nvim-surround"] = function ()
    require("nvim-surround").setup({
      keymaps = {
        visual = "gs",
        visual_line = "gS",
      },
    })
  end,

  ["better-escape"] = function ()
    require("better_escape").setup{
      mapping = {"jk", "kj", "jj", "kk"}
    }
  end,

  ["vim-easy-align"] = function ()
    vim.g.easy_align_interactive_modes = {'c', 'l', 'r'}
    vim.g.easy_align_bang_interactive_modes = {'c', 'l', 'r'}
  end
}
return config
