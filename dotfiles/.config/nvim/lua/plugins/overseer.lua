return {
  -- overseer
  {
    'stevearc/overseer.nvim',
    opts = {
      --[[ strategy = {
        "toggleterm",
        direction = "tab",
      }, ]]
      templates = {
        "builtin",
        "cmake.build",
        "cmake.configure",
        "cmake.cpm",
      },
    },
    keys = {
      { '<leader>rr', '<cmd>OverseerRun<cr>',          desc = "Run tasks", },
      { '<leader>ro', '<cmd>OverseerToggle right<cr>', desc = "Toggle overseer", },
    }
  },
}
