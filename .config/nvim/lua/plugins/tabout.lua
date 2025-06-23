return {
  --
  {
    'abecodes/tabout.nvim',
    event = "VeryLazy",
    opts = {
      tabkey = '<A-n>',
      backwards_tabkey = '<A-p>',
    },
    keys = {
      { '<A-n>', "<Plug>(TaboutMulti)",     { noremap = false, silent = true }, mode = "i" },
      { '<A-p>', "<Plug>(TaboutBackMulti)", { noremap = false, silent = true }, mode = "i" },
    }
  },
}
