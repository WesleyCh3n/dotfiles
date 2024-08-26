return {
  {
    'akinsho/bufferline.nvim',
    event = "VeryLazy",
    opts = {
      options = {
        numbers = function(opts)
          return string.format('%s', opts.raise(opts.ordinal))
        end,
        left_trunc_marker = '',
        right_trunc_marker = '',
        middle_mouse_command = "vertical sbuffer %d",
        offsets = {
          { filetype = "NvimTree", text = " File Explorer", text_align = "center" },
          { filetype = "neo-tree", text = " File Explorer", text_align = "center" },
        },
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(_, _, diagnostics_dict, _)
          local s = " "
          for e, n in pairs(diagnostics_dict) do
            local sym = e == "error" and " "
                or (e == "warning" and " " or " ")
            s = s .. n .. sym
          end
          return s
        end,
        separator_style = "thick",
        enforce_regular_tabs = true,
        always_show_bufferline = false,
        show_close_icon = false,
        show_tab_indicators = false,
      },
      highlights = {
        fill = {
          bg = "#3c3836"
        },
        separator_selected = {
          fg = "#3c3836"
        },
        separator_visible = {
          fg = "#3c3836"
        },
        separator = {
          fg = "#3c3836"
        },
      },
    },
    keys = {
      { '<space>1',  '<cmd>BufferLineGoToBuffer 1<cr>', desc = 'which_key_ignore' },
      { '<space>2',  '<cmd>BufferLineGoToBuffer 2<cr>', desc = 'which_key_ignore' },
      { '<space>3',  '<cmd>BufferLineGoToBuffer 3<cr>', desc = 'which_key_ignore' },
      { '<space>4',  '<cmd>BufferLineGoToBuffer 4<cr>', desc = 'which_key_ignore' },
      { '<space>5',  '<cmd>BufferLineGoToBuffer 5<cr>', desc = 'which_key_ignore' },
      { '<space>6',  '<cmd>BufferLineGoToBuffer 6<cr>', desc = 'which_key_ignore' },
      { '<space>7',  '<cmd>BufferLineGoToBuffer 7<cr>', desc = 'which_key_ignore' },
      { '<space>8',  '<cmd>BufferLineGoToBuffer 8<cr>', desc = 'which_key_ignore' },
      { '<space>9',  '<cmd>BufferLineGoToBuffer 9<cr>', desc = 'which_key_ignore' },
      { '<space>t',  "<cmd>BufferLinePick<cr>",         desc = "pick buf" },
      { '<leader>H', '<cmd>BufferLineMovePrev<cr>',     desc = 'tab move left', },
      { '<leader>L', '<cmd>BufferLineMoveNext<cr>',     desc = 'tab move right', },
      { 'gt',        '<cmd>BufferLineCycleNext<cr>', },
      { 'gT',        '<cmd>BufferLineCyclePrev<cr>', },
    },
  }
}
