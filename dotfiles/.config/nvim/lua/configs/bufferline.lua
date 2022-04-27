
require("bufferline").setup{
  options = {
    left_trunc_marker = '',
    right_trunc_marker = '',
    middle_mouse_command = "vertical sbuffer %d",
    offsets = {{filetype = "neo-tree", text = " File Explorer", text_align = "center"}},
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = true,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " "
          or (e == "warning" and " " or " " )
        s = s .. n .. sym
      end
      return s
    end,
    separator_style = "thick",
    enforce_regular_tabs = true,
    always_show_bufferline = true,
    show_close_icon = false,
    show_tab_indicators = false,
  },
  highlights = {
    fill = {
      guibg = "#3c3836"
    },
    separator_selected = {
      guifg = "#3c3836"
    },
    separator_visible = {
      guifg = "#3c3836"
    },
    separator = {
      guifg = "#3c3836"
    },
  },
}
