return {
  --
  {
    'junegunn/vim-easy-align',
    event = "VeryLazy",
    config = function()
      vim.g.easy_align_interactive_modes = { 'c', 'l', 'r' }
      vim.g.easy_align_bang_interactive_modes = { 'c', 'l', 'r' }
    end,
    keys = {
      { 'ga', '<Plug>(EasyAlign)', { noremap = false, silent = true }, mode = "x" },
      { 'ga', '<Plug>(EasyAlign)', { noremap = false, silent = true }, mode = "n" }
    }
  },
}
