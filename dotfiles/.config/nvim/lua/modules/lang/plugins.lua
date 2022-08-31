local plugin = require("core.pack").register_plugin
local conf = require("modules.lang.config")

plugin({
  'mattn/emmet-vim',
  config = conf.emmet_vim
})
plugin({ 'MaxMEllon/vim-jsx-pretty' })
