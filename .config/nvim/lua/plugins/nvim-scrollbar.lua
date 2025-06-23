return {
  {
    "petertriho/nvim-scrollbar",
    opts = {
      marks = {
        Cursor = {
          text = ""
        }
      },
      handle = {
        color = '#665c54',
      },

      excluded_buftypes = {
        "nofile",
        "popup",
      },
      excluded_filetypes = {
        "popup",
        "cmp_menu",
        "cmp_docs",
        "blink-cmp-menu",
        "blink-cmp-signature",
        "blink-cmp-documentation",
      },
    }
  },
}
