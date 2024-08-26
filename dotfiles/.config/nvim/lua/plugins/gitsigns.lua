return {
  {
    'lewis6991/gitsigns.nvim',
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      numhl = false,
      linehl = false,
      watch_gitdir = {
        interval = 1000,
        follow_files = true
      },
      current_line_blame = false,
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil,
      word_diff = false,
      -- keymaps = {},
    },
    keys = {
      { '<leader>gh', '<cmd>Gitsigns preview_hunk<cr>', desc = 'preview hunk', },
      { '<leader>gn', '<cmd>Gitsigns next_hunk<cr>',    desc = 'next hunk', },
      { '<leader>gp', '<cmd>Gitsigns prev_hunk<cr>',    desc = 'prev hunk', },
      { '<leader>gb', '<cmd>Gitsigns blame_line<cr>',   desc = 'blame line', },
      { '<leader>gq', '<cmd>Gitsigns setqflist<cr>',    desc = 'set quickfix list', },
    },
  },
}
