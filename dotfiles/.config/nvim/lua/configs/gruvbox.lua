
vim.g.gruvbox_material_background             = 'medium'
vim.g.gruvbox_material_current_word           = 'grey background'
vim.g.gruvbox_material_transparent_background = 1
vim.cmd('silent! colorscheme gruvbox-material')
vim.cmd[[

hi FloatBorder  guifg=#928374 guibg=NONE
hi NormalFloat  guifg=#ddc7a1 guibg=NONE
hi WhichKeyFloat ctermbg='NONE' guibg='NONE'

hi ErrorFloat   guifg=#ea6962 guibg=NONE
hi WarningFloat guifg=#d8a657 guibg=NONE
hi InfoFloat    guifg=#7daea3 guibg=NONE
hi HintFloat    guifg=#a9b665 guibg=NONE

hi DiagnosticError guifg=#ea6962
hi DiagnosticWarn guifg=#d8a657
hi DiagnosticInfo guifg=#7daea3
hi DiagnosticHint guifg=#a9b665

hi link DiagnosticVirtualTextError ErrorFloat
hi link DiagnosticVirtualTextWarn WarningFloat
hi link DiagnosticVirtualTextInfo InfoFloat
hi link DiagnosticVirtualTextHint HintFloat

]]
