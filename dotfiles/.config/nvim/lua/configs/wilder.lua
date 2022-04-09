local wilder = require('wilder')
wilder.setup({modes = {':', '/', '?'}})

wilder.set_option('pipeline', {
  wilder.debounce(10),
  wilder.branch(
    {
      wilder.check(function(ctx, x) return x == '' end),
      wilder.history(),
    },
    wilder.cmdline_pipeline({
      language = 'vim',
      fuzzy = 1,
      fuzzy_filter = wilder.vim_fuzzy_filter(),
    }),
    wilder.substitute_pipeline({
      pipeline = wilder.python_search_pipeline({
        skip_cmdtype_check = 1,
        pattern = wilder.python_fuzzy_pattern({
          start_at_boundary = 0,
        }),
      })
    })
  ),
})

local popupmenu_renderer = wilder.popupmenu_renderer(
  wilder.popupmenu_border_theme({
    border = 'rounded',
    min_height = '0%',
    max_height = '20%',
    empty_message = wilder.popupmenu_empty_message_with_spinner(),
    highlighter = wilder.basic_highlighter(),
    highlights = {
      default = 'Wilder',
      border = 'Comment',
    },
    left = {
      ' ',
      wilder.popupmenu_devicons(),
    },
    right = {
      ' ',
      wilder.popupmenu_scrollbar({
        scrollbar_hl = "WilderScroll",
      }),
    },
  })
)

local wildmenu_renderer = wilder.popupmenu_renderer(
  wilder.popupmenu_border_theme({
    border = 'rounded',
    highlighter = wilder.basic_highlighter(),
    highlights = {
      default = 'Wilder',
      border = 'Comment',
    },
    min_height = '0%',
    max_height = '20%',
  })
)

wilder.set_option('renderer', wilder.renderer_mux({
  [':'] = popupmenu_renderer,
  ['/'] = wildmenu_renderer,
  substitute = wildmenu_renderer,
}))
