local plugin = require('core.pack').register_plugin
local conf = require('modules.ui.config')

plugin({'sainnhe/gruvbox-material', config = conf.gruvbox})
plugin({'kyazdani42/nvim-web-devicons'})
plugin({'nvim-lualine/lualine.nvim', config = conf.lualine})
plugin({'akinsho/bufferline.nvim', tag = 'v2.*', config = conf.bufferline})
plugin({'RRethy/vim-illuminate', config = conf.illuminate})
plugin({'goolord/alpha-nvim', config = conf.alpha})
plugin({'lukas-reineke/indent-blankline.nvim', config = conf.indentline})
plugin({"folke/which-key.nvim", config = conf.whichkey})
plugin({'lewis6991/gitsigns.nvim', config = conf.gitsigns})
plugin({"petertriho/nvim-scrollbar", config = conf.scrollbar})
plugin({"luukvbaal/stabilize.nvim", config = conf.stabilize})