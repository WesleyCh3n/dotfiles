call wilder#setup({
\     'modes': [':', '/', '?'],
\     'accept_key': '<Right>',
\     'reject_key': '<Left>',
\})

call wilder#set_option('pipeline', [
\     wilder#debounce(10),
\     wilder#branch(
\         [
\             wilder#check({_, x -> empty(x)}),
\             wilder#history(),
\         ],
\         wilder#substitute_pipeline({
\             'pipeline': wilder#python_search_pipeline({
\                 'skip_cmdtype_check': 1,
\                 'pattern': wilder#python_fuzzy_pattern({
\                     'start_at_boundary': 0,
\                 }),
\             }),
\         }),
\         wilder#cmdline_pipeline({
\             'language': 'vim',
\             'fuzzy': 1,
\             'fuzzy_filter': wilder#vim_fuzzy_filter(),
\         }),
\     ),
\ ])

let s:popupmenu_renderer = wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
\     'highlights': {
\         'default': 'Wilder',
\         'border': 'Comment',
\     },
\     'border': 'rounded',
\     'highlighter': wilder#basic_highlighter(),
\     'empty_message': wilder#popupmenu_empty_message_with_spinner(),
\     'min_height': '0%',
\     'max_height': '20%',
\     'reverse': 0,
\     'left': [
\     ' ',
\     wilder#popupmenu_devicons(),
\     ],
\     'right': [
\     ' ',
\     wilder#popupmenu_scrollbar({
\         'scrollbar_hl': "WilderScroll",
\         }),
\     ],
\ }))

let s:wildmenu_renderer = wilder#popupmenu_renderer({
\     'highlighter': wilder#basic_highlighter(),
\     'min_height': '0%',
\     'max_height': '15%',
\ })

call wilder#set_option('renderer', wilder#renderer_mux({
\     ':': s:popupmenu_renderer,
\     '/': s:wildmenu_renderer,
\     'substitute': s:wildmenu_renderer,
\ }))
