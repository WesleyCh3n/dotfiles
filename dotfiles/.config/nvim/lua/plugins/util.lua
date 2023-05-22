return {
  -- library used by other plugins
  { "nvim-lua/plenary.nvim", lazy = true },

  -- makes some plugins dot-repeatable like leap
  { "tpope/vim-repeat",      event = "VeryLazy" },

  --
  {
    'akinsho/toggleterm.nvim',
    lazy = true,
    branch = 'main',
    keys = {
      { "<space>ag", '<cmd>lua lazygit_toggle()<cr>',       desc = '  lazygit' },
      { "<space>ab", '<cmd>lua top_toggle()<cr>',           desc = '  btop' },
      { "<space>ap", '<cmd>lua python_toggle()<cr>',        desc = '  python' },
      { "<space>as", '<cmd>ToggleTermToggleAll<cr>',        desc = '  toggle all' },
      { "<space>aj", '<cmd>1ToggleTerm<cr>',                desc = '  #1' },
      { "<space>ak", '<cmd>2ToggleTerm<cr>',                desc = '  #2' },
      { "<space>al", '<cmd>3ToggleTerm<cr>',                desc = '  #3' },
      { "<space>a;", '<cmd>ToggleTerm direction=float<cr>', desc = '  #float' },
    },
    config = function()
      local gruvbox_conf = vim.fn['gruvbox_material#get_configuration']()
      local c = vim.fn['gruvbox_material#get_palette'](
        gruvbox_conf.background,
        gruvbox_conf.foreground,
        gruvbox_conf.colors_override)
      require("toggleterm").setup {
        size = 10,
        direction = 'horizontal',
        shell = (vim.loop.os_uname().sysname ~= "Windows_NT")
            and vim.o.shell or "nu.exe",
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
      local lazygit = Terminal:new(mycmd("lazygit"))
      local top = Terminal:new(
        vim.loop.os_uname().sysname == 'Windows_NT'
        and mycmd("btm")
        or mycmd("btop")
      )
      local node = Terminal:new(mycmd("node"))
      local python = Terminal:new(mycmd("python3"))
      function _G.lazygit_toggle() lazygit:toggle() end

      function _G.top_toggle() top:toggle() end

      function _G.node_toggle() node:toggle() end

      function _G.python_toggle() python:toggle() end
    end
  },

  --
  {
    'iamcco/markdown-preview.nvim',
    event = "BufEnter *.md",
    keys = {
      { '<space>p', '<cmd>MarkdownPreviewToggle<cr>', desc = ' md preview' },
    },
    build = function() vim.fn['mkdp#util#install']() end,
    config = function()
      vim.g.mkdp_auto_close = 0
      vim.g.mkdp_port = '8080'
      vim.g.mkdp_echo_preview_url = 1
      vim.g.mkdp_highlight_css =
          os.getenv("HOME") ..
          "/dotfiles/dotfiles/.config/nvim/gruvbox-dark-medium.css"
    end
  },

  --
  {
    "jbyuki/venn.nvim",
    lazy = true,
    keys = {
      { '<leader>v', '<cmd>lua Toggle_venn()<cr>', desc = 'toggle venn draw' }
    },
    config = function()
      function _G.Toggle_venn()
        local venn_enabled = vim.inspect(vim.b.venn_enabled)
        if venn_enabled == "nil" then
          print("Venn Enabled")
          vim.b.venn_enabled = true
          vim.cmd [[setlocal ve=all]]
          vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", { noremap = true })
          vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", { noremap = true })
          vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", { noremap = true })
          vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", { noremap = true })
          vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", { noremap = true })
        else
          print("Venn Disable")
          vim.cmd [[setlocal ve=]]
          vim.cmd [[mapclear <buffer>]]
          vim.b.venn_enabled = nil
        end
      end
    end
  },

  --
  { 'wakatime/vim-wakatime' }
}
