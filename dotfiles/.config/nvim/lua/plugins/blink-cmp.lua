return {
  {
    'saghen/blink.cmp',
    event = 'VeryLazy',
    version = '1.*',
    opts = {
      keymap = {
        preset = 'default',
        ['<cr>'] = { 'accept', "fallback" },
        ["<C-j>"] = { "snippet_forward", "fallback" },
        ["<C-k>"] = { "snippet_backward", "fallback" },
        ["<C-d>"] = { "scroll_documentation_down", "fallback" },
        ["<C-u>"] = { "scroll_documentation_up", "fallback" },
      },
      appearance = {
        nerd_font_variant = 'mono',
      },
      completion = {
        documentation = { auto_show = true, window = { border = "rounded" }, auto_show_delay_ms = 100 },
        ghost_text = { enabled = true },
        menu = {
          auto_show = true,
          draw = {
            columns = {
              { "kind_icon", },
              { "label", },
              { "kind", },
              -- { "source_name" },
            },
            components = {
              kind_icon = {
                text = function(ctx)
                  return " " .. ctx.kind_icon .. " "
                end,
                highlight = function(ctx)
                  return { { group = "BlinkCmpKindIcon" .. ctx.kind, priority = 50000 } }
                end,
              }
            }
          }
        }
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        providers = {
          lsp = {
            name = "lsp",
            enabled = true,
            module = "blink.cmp.sources.lsp",
            score_offset = 4,
            -- fallbacks = { "snippets" }
          },
          snippets = {
            name = "snippets",
            enabled = true,
            module = "blink.cmp.sources.snippets",
            score_offset = 3
          },
          path = {
            name = "Path",
            enabled = true,
            module = "blink.cmp.sources.path",
            score_offset = 2,
            opts = {
              show_hidden_files_by_default = true,
            }
          },
          buffer = {
            name = "Buffer",
            enabled = true,
            module = "blink.cmp.sources.buffer",
            score_offset = 1
          },
        }
      },
      snippets = { preset = 'luasnip' },
      fuzzy = { implementation = 'prefer_rust_with_warning' },
      signature = {
        enabled = true,
        window = {
          border = "rounded"
        }
      },
    },
  },
}
