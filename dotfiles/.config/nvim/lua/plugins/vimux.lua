return {
  {
    'preservim/vimux',
    config = function()
      local function run_cmd_in_tmux()
        vim.ui.input({ prompt = "Enter command: " }, function(input)
          if input ~= "" then
            vim.fn.VimuxRunCommand(input)
          else
            vim.notify("No input provided.")
          end
        end
        )
      end

      vim.keymap.set('n', '<space>vr', run_cmd_in_tmux)
      vim.keymap.set('n', '<space>vv', vim.fn.VimuxTogglePane)
      vim.keymap.set('n', '<space>vz', vim.fn.VimuxZoomRunner)
      vim.keymap.set('n', '<space>vo', vim.fn.VimuxOpenRunner)
      vim.keymap.set('n', '<space>vc', vim.fn.VimuxCloseRunner)
    end
  },
}
