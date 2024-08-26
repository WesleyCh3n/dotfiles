return {
  --
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPost", "BufNewFile" },
    keys = {
      { "<space>ft", '<cmd>TodoTelescope<cr>', desc = 'Todo' },
    },
    config = true
  },
}
