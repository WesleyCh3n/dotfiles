
local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')
dashboard.section.header.val = {
[[                               __                ]],
[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}
dashboard.section.buttons.val = {
dashboard.button( "e", "  New file" , ':ene <BAR> startinsert <CR>'),
dashboard.button( "f", "  Telescope" , ':lua require("telescope.builtin").find_files(tlscp_opts(""))<cr>'),
dashboard.button( "q", "  Quit NVIM" , ':qa<CR>'),
}
dashboard.section.footer.val = require('alpha.fortune')()
alpha.setup(dashboard.opts)
