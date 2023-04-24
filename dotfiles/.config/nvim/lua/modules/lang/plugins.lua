local plugin = require("core.pack").register_plugin
local conf = require("modules.lang.config")

plugin({
  'mattn/emmet-vim',
  config = conf.emmet_vim
})
plugin({ 'MaxMEllon/vim-jsx-pretty' })
plugin({ "simrat39/rust-tools.nvim" })
plugin({
  'mfussenegger/nvim-dap',
  config = function()
    local dap = require('dap')
    dap.adapters.cppdbg = {
      id = 'cppdbg',
      type = 'executable',
      command = '/Users/yochen/.local/bin/extension/debugAdapters/bin/OpenDebugAD7',
    }
    dap.configurations.cpp = {
      {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopAtEntry = true,
      },
      {
        name = 'Attach to gdbserver :1234',
        type = 'cppdbg',
        request = 'launch',
        MIMode = 'gdb',
        miDebuggerServerAddress = 'localhost:1234',
        miDebuggerPath = '/usr/bin/gdb',
        cwd = '${workspaceFolder}',
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
      },
    }
    dap.configurations.c = dap.configurations.cpp
  end
})
