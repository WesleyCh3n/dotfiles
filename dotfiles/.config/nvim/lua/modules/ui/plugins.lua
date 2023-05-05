local plugin = require('core.pack').register_plugin
local conf = require('modules.ui.config')

plugin({ 'sainnhe/gruvbox-material', config = conf.gruvbox })
plugin({ 'kyazdani42/nvim-web-devicons' })
plugin({ 'nvim-lualine/lualine.nvim', config = conf.lualine })
plugin({ 'akinsho/bufferline.nvim', tag = 'v2.*', config = conf.bufferline })
plugin({ 'RRethy/vim-illuminate', config = conf.illuminate })
plugin({ 'goolord/alpha-nvim', config = conf.alpha })
plugin({ 'lukas-reineke/indent-blankline.nvim', config = conf.indentline })
plugin({ "folke/which-key.nvim", config = conf.whichkey })
plugin({ 'lewis6991/gitsigns.nvim', config = conf.gitsigns })
plugin({ "petertriho/nvim-scrollbar", config = conf.scrollbar })
plugin({ "luukvbaal/stabilize.nvim", config = conf.stabilize })
plugin({ 'stevearc/dressing.nvim', config = conf.dressing })
plugin({
  "SmiteshP/nvim-navic",
  requires = { { "neovim/nvim-lspconfig" }, { "sainnhe/gruvbox-material" } }
})
plugin({
  "utilyre/barbecue.nvim",
  requires = { "SmiteshP/nvim-navic" },
  tag = "*",
  config = function()
    require("barbecue").setup({
      exclude_filetypes = { "gitcommit", "toggleterm", "DressingInput" },
    })
  end
})
plugin({
  'tamton-aquib/duck.nvim',
  config = function()
    vim.keymap.set('n', '<leader>k', function() require("duck").hatch() end, {})
    -- vim.keymap.set('n', '<leader>dk', function() require("duck").cook() end, {})
  end
})
plugin({
  'rcarriga/nvim-notify',
  config = function()
    vim.notify = require("notify")
    local banned_messages = { "No information available" }
    vim.notify = function(msg, ...)
      for _, banned in ipairs(banned_messages) do
        if msg == banned then
          return
        end
      end
      return require("notify")(msg, ...)
    end
  end
})
