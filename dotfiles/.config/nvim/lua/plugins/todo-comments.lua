return {
  --
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPost", "BufNewFile" },
    keys = {
      { "<space>to", '<cmd>TodoTelescope<cr>', desc = 'todo' },
    },
    config = true
  },
}
