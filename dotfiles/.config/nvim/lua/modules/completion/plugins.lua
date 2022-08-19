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
    { 'saadparwaiz1/cmp_luasnip' },
    { 'honza/vim-snippets' },
  }
})
plugin({
  "neovim/nvim-lspconfig",
  event = "BufRead",
  requires = 'williamboman/nvim-lsp-installer',
  config = conf.lspconfig
})
plugin({
  'stevearc/aerial.nvim',
  config = function() require('aerial').setup({
      layout = {
        min_width = 30,
      },
      filter_kind = {
        "Array",
        "Boolean",
        "Class",
        "Constant",
        "Constructor",
        "Enum",
        "EnumMember",
        "Event",
        "Field",
        "File",
        "Function",
        "Interface",
        "Key",
        "Method",
        "Module",
        "Namespace",
        "Null",
        "Number",
        "Object",
        "Operator",
        "Package",
        "Property",
        "String",
        "Struct",
        "TypeParameter",
        "Variable",
      },
    })
  end
})
plugin({ 'ray-x/lsp_signature.nvim', event = 'BufRead' })
