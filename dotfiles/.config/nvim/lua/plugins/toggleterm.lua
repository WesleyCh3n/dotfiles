return {
  {
    'akinsho/toggleterm.nvim',
    lazy = true,
    branch = 'main',
    keys = {
      { "<space>ag", '<cmd>lua lazygit_toggle()<cr>',       desc = 'lazygit' },
      { "<space>an", '<cmd>lua nnn_toggle()<cr>',           desc = 'nnn' },
      { "<space>ab", '<cmd>lua top_toggle()<cr>',           desc = 'btop' },
      { "<space>as", '<cmd>ToggleTermToggleAll<cr>',        desc = 'toggle all' },
      { "<space>aj", '<cmd>1ToggleTerm<cr>',                desc = '#1' },
      { "<space>ak", '<cmd>2ToggleTerm<cr>',                desc = '#2' },
      { "<space>al", '<cmd>3ToggleTerm<cr>',                desc = '#3' },
      { "<space>a;", '<cmd>ToggleTerm direction=float<cr>', desc = '#float' },
    },
    config = function()
      local gruvbox_conf = vim.fn['gruvbox_material#get_configuration']()
      local c = vim.fn['gruvbox_material#get_palette'](
        gruvbox_conf.background,
        gruvbox_conf.foreground,
        gruvbox_conf.colors_override)
      require("toggleterm").setup {
        persist_size = false,
        direction = 'horizontal',
        shell = (vim.loop.os_uname().sysname ~= "Windows_NT")
            and vim.o.shell or "cmd.exe",
        float_opts = {
          border = 'curved'
        },
        highlights = {
          NormalFloat = {
            guibg = c.bg_dim[1],
          },
          FloatBorder = {
            guifg = c.bg_dim[1],
            guibg = c.bg_dim[1],
          },
        }
      }
      local Terminal = require('toggleterm.terminal').Terminal
      local function mycmd(cmd)
        return {
          cmd = cmd,
          direction = 'float',
          hidden = true,
        }
      end
      local nnn = Terminal:new(mycmd("nnn"))
      local lazygit = Terminal:new(mycmd("lazygit"))
      local top = Terminal:new(
        vim.loop.os_uname().sysname == 'Windows_NT'
        and mycmd("btm")
        or mycmd("btop")
      )
      function _G.lazygit_toggle() lazygit:toggle() end

      function _G.nnn_toggle() nnn:toggle() end

      function _G.top_toggle() top:toggle() end

      vim.keymap.set('n', '<leader>s', "<cmd>ToggleTermSendCurrentLine<cr>")
      vim.keymap.set('v', '<leader>s', "<cmd>ToggleTermSendVisualLines<cr>")
    end
  },
}
