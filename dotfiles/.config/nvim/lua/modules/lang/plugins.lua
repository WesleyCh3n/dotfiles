local plugin = require("core.pack").register_plugin
local conf = require("modules.lang.config")

plugin ({
  'psf/black',
  config = conf.blac
})
plugin ({
  'mattn/emmet-vim',
  config = conf.emmet_vim
})
plugin ({'MaxMEllon/vim-jsx-pretty'})
plugin ({
  'prettier/vim-prettier',
  run = 'yarn install',
  ft = {'javascript', 'typescript', 'typescriptreact', 'javascriptreact',
    'css', 'less', 'scss', 'markdown', 'html'}
})
