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
        "cpp.cmake-release",
        "cpp.cmake-debug",
        "cpp.cmake-ninja-release",
        "cpp.cmake-ninja-debug",
        "cpp.cmake-configure",
        "cpp.cmake-cpm",
        "cpp.valgrind",
      },
    },
    keys = {
      { '<leader>rr', '<cmd>OverseerRun<cr>',          desc = "Overseer run tasks", },
      { '<leader>ro', '<cmd>OverseerToggle right<cr>', desc = "Overseer", },
    }
  },
}
