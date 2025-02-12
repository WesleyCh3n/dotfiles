return {
  {
    'stevearc/dressing.nvim',
    -- event = "LspAttach",
    opts = {
      input = {
        win_options = {
          winblend = 0,
        },
        get_config = function(opts)
          -- if vim.api.nvim_buf_get_option(0, "filetype") == "NvimTree" then
          --   return { enabled = false }
          -- end
          if opts.prompt == "Run Command:" then
            return { relative = 'editor' }
          end
        end,
      },
    }
  },
}
