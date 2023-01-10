local plugin = require('core.pack').register_plugin
local conf = require('modules.tools.config')

plugin({
  'brenoprata10/nvim-highlight-colors',
  config = function()
    require('nvim-highlight-colors').setup({
      enable_tailwind = true
    })
  end
})

plugin({
  'akinsho/toggleterm.nvim',
  branch = 'main',
  config = conf.toggleterm
})
plugin({
  'iamcco/markdown-preview.nvim',
  run = function() vim.fn['mkdp#util#install']() end,
  ft = { 'markdown' },
  config = conf.markdown_preview
})
-- plugin({
--   "nvim-neorg/neorg",
--   config = conf.neorg,
--   requires = "nvim-lua/plenary.nvim"
-- })
plugin({ 'vimwiki/vimwiki', branch = 'dev', config = conf.vimwiki })
plugin({ 'phaazon/mind.nvim', branch = 'v2.2', config = function()
  require 'mind'.setup()
end })
plugin({
  "jbyuki/venn.nvim",
  config = conf.venn
})
plugin({ 'wakatime/vim-wakatime' })
