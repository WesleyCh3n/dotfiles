return {
  {
    'preservim/vimux',
    enabled = false,
    config = function()
      local function run_cmd_in_tmux()
        vim.ui.input({ prompt = "Run Command:" }, function(input)
          if input ~= "" and input ~= vim.v.null and input ~= nil then
            vim.fn.VimuxRunCommand(input)
          else
            vim.notify("No input provided.")
          end
        end
        )
      end

      vim.keymap.set('n', '<space>rr', run_cmd_in_tmux, { desc = "Tmux runner cmd" })
      vim.keymap.set('n', '<space>rv', vim.fn.VimuxTogglePane, { desc = "Tmux runner toggle" })
      vim.keymap.set('n', '<space>rz', vim.fn.VimuxZoomRunner, { desc = "Tmux runner zoom" })
      vim.keymap.set('n', '<space>ro', vim.fn.VimuxOpenRunner, { desc = "Tmux runner open" })
      vim.keymap.set('n', '<space>rx', vim.fn.VimuxCloseRunner, { desc = "Tmux runner close" })
    end
  },
}
