return {
  {
    'preservim/vimux',
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

      vim.keymap.set('n', '<space>vr', run_cmd_in_tmux)
      vim.keymap.set('n', '<space>vv', vim.fn.VimuxTogglePane)
      vim.keymap.set('n', '<space>vz', vim.fn.VimuxZoomRunner)
      vim.keymap.set('n', '<space>vo', vim.fn.VimuxOpenRunner)
      vim.keymap.set('n', '<space>vx', vim.fn.VimuxCloseRunner)
    end
  },
}
