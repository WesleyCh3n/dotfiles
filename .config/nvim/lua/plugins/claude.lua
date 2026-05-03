return {
  {
    "coder/claudecode.nvim",
    dependencies = {
      "folke/snacks.nvim",
    },
    config = true,
    opts = {
      terminal = {
        snacks_win_opts = {
          position = "left",
          width = 0.25,
          keys = {
            nav_h = {
              '<C-h>',
              function()
                vim.cmd('stopinsert')
                vim.cmd('TmuxNavigateLeft')
              end,
              mode = 't',
              desc = 'Navigate left'
            },
            nav_j = {
              '<C-j>',
              function()
                vim.cmd('stopinsert')
                vim.cmd('TmuxNavigateDown')
              end,
              mode = 't',
              desc = 'Navigate down'
            },
            nav_k = {
              '<C-k>',
              function()
                vim.cmd('stopinsert')
                vim.cmd('TmuxNavigateUp')
              end,
              mode = 't',
              desc = 'Navigate up'
            },
            nav_l = {
              '<C-l>',
              function()
                vim.cmd('stopinsert')
                vim.cmd('TmuxNavigateRight')
              end,
              mode = 't',
              desc = 'Navigate right'
            },
          },
        },
      }
    },
    keys = {
      { "<leader>a",  nil,                              desc = "AI/C,laude Code" },
      { "<leader>ac", "<cmd>ClaudeCode<cr>",            desc = "Toggle Claude" },
      { "<leader>af", "<cmd>ClaudeCodeFocus<cr>",       desc = "Focus Claude" },
      { "<leader>ar", "<cmd>ClaudeCode --resume<cr>",   desc = "Resume Claude" },
      { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
      { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
      { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>",       desc = "Add current buffer" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>",        mode = "v",                  desc = "Send to Claude" },
      {
        "<leader>as",
        "<cmd>ClaudeCodeTreeAdd<cr>",
        desc = "Add file",
        ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
      },
      -- Diff management
      { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
      { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>",   desc = "Deny diff" },
    },
  }
}
