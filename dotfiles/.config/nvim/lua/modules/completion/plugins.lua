local plugin = require('core.pack').register_plugin
local conf = require('modules.completion.config')

plugin({
  "hrsh7th/nvim-cmp",
  requires = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-emoji',
  },
  config = conf.nvim_cmp
})
plugin({
  'L3MON4D3/LuaSnip',
  config = conf.luasnip,
  requires = {
    {'saadparwaiz1/cmp_luasnip'},
    {'honza/vim-snippets'},
  }
})
plugin ({
  "neovim/nvim-lspconfig",
  event = "BufRead",
  requires = 'williamboman/nvim-lsp-installer',
  config = conf.lspconfig
})
plugin ({
  "glepnir/lspsaga.nvim",
  branch = "main",
  config = conf.lspsaga,
})
plugin ({ 'ray-x/lsp_signature.nvim', event = 'BufRead' })
plugin ({
  'stevearc/dressing.nvim',
  config = conf.dressing
})
plugin ({
  'tzachar/cmp-tabnine',
  run='./install.sh',
  requires = 'hrsh7th/nvim-cmp',
  config = conf.cmp_tabnine
})
