return {
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function(_, _)
      vim.keymap.set("n", "gs", "<Plug>(nvim-surround-change)", {
        desc = "Change a surrounding pair",
      })
      vim.keymap.set("n", "gS", "<Plug>(nvim-surround-change-line)", {
        desc = "Change a surrounding pair, putting replacements on new lines",
      })
    end,
  },
}
