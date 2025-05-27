return {
  --
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble" },
    event = { "BufReadPost", "BufNewFile" },
    keys = {
      { "<space>to", function() Snacks.picker.todo_comments() end, desc = "Todo/Fix" },
    },
    config = true
  },
}
