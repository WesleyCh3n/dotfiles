return {
  -- overseer
  {
    'stevearc/overseer.nvim',
    opts = {
      strategy = {
        "toggleterm",
        direction = "horizontal",
        quit_on_exit = "success",
      },
      templates = {
        "builtin",
        "cpp.cmake-build",
        "cpp.cmake-debug",
        "cpp.cmake-configure",
        "cpp.cmake-cpm",
        "cpp.valgrind",
      },
    },
    keys = {
      { '<leader>rr', '<cmd>OverseerRun<cr>',          desc = "Run tasks", },
      { '<leader>R',  '<cmd>OverseerToggle right<cr>', desc = "Toggle overseer", },
    }
  },
}
