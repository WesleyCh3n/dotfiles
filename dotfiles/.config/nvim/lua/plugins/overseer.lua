return {
  -- overseer
  {
    'stevearc/overseer.nvim',
    opts = {
      strategy = {
        "toggleterm",
        direction = "horizontal",
      },
      templates = {
        "builtin",
        "cpp.cmake-build",
        "cpp.cmake-configure",
        "cpp.cmake-cpm",
        "cpp.valgrind",
      },
    },
    keys = {
      { '<leader>rr', '<cmd>OverseerRun<cr>',          desc = "Run tasks", },
      { '<leader>ro', '<cmd>OverseerToggle right<cr>', desc = "Toggle overseer", },
    }
  },
}
