local plugin = require('core.pack').register_plugin
local conf = require('modules.editor.config')

plugin({
  'nvim-telescope/telescope.nvim',
  config = conf.telescope
})
plugin({ 'nvim-telescope/telescope-symbols.nvim', })
plugin({
  "nvim-treesitter/nvim-treesitter",
  run = function()
    require('nvim-treesitter.install').update({ with_sync = true })
  end,
  config = conf.treesitter,
})
plugin({ 'p00f/nvim-ts-rainbow',
  event = "BufRead",
  requires = "nvim-treesitter/nvim-treesitter",
})
plugin({
  'nvim-treesitter/nvim-treesitter-textobjects',
  requires = "nvim-treesitter/nvim-treesitter",
})
plugin({
  'ggandor/leap.nvim',
  config = conf.leap,
  requires = { 'tpope/vim-repeat' },
})
plugin({
  'wellle/targets.vim',
  config = conf.targets
})
plugin({
  "windwp/nvim-autopairs",
  config = conf.autopairs
})
plugin({
  "kylechui/nvim-surround",
  config = conf.surround,
})
plugin({
  'abecodes/tabout.nvim',
  config = conf.tabout
})
plugin({
  'kyazdani42/nvim-tree.lua',
  tag = 'nightly',
  config = conf.nvim_tree
})
plugin({
  "max397574/better-escape.nvim",
  config = conf.better_escape
})
plugin({
  'numToStr/Comment.nvim',
  config = conf.comment
})
plugin({
  'anuvyklack/hydra.nvim',
  config = conf.hydra
})
plugin({
  'junegunn/vim-easy-align',
  config = conf.vim_easy_align
})
plugin({
  "folke/zen-mode.nvim",
  config = conf.zen_mode
})
plugin({
  "folke/todo-comments.nvim",
  config = conf.todo_comments
})

plugin({ 'christoomey/vim-tmux-navigator' })
plugin({ 'mg979/vim-visual-multi' })

plugin({ 'tversteeg/registers.nvim', event = 'BufEnter', config = conf.registers })
plugin({ 'mhartington/formatter.nvim', config = conf.formatter })
