vim.g.coc_global_extensions = {
  'coc-json',
  'coc-snippets',
  'coc-tsserver',
  'coc-pyright',
  'coc-go'
}

vim.fn['coc#config']('suggest', {
  ['completionItemKindLabels']= {
    ["method"]        = "  ",
    ["function"]      = "  ",
    ["variable"]      = "  ",
    ["field"]         = " ﰠ ",
    ["typeParameter"] = "  ",
    ["constant"]      = "  ",
    ["class"]         = " ﴯ ",
    ["interface"]     = "  ",
    ["struct"]        = " פּ ",
    ["event"]         = "  ",
    ["operator"]      = "  ",
    ["module"]        = "  ",
    ["property"]      = " ﰠ ",
    ["enum"]          = "  ",
    ["reference"]     = "  ",
    ["keyword"]       = "  ",
    ["file"]          = "  ",
    ["folder"]        = " ﱮ ",
    ["color"]         = "  ",
    ["unit"]          = " 塞",
    ["snippet"]       = "  ",
    ["text"]          = "  ",
    ["constructor"]   = "  ",
    ["value"]         = "  ",
    ["enumMember"]    = "  "
  }
})
