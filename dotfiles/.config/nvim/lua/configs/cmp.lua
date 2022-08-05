local function prequire(...)
  local status, lib = pcall(require, ...)
  if (status) then return lib end
  return nil
end

local luasnip = prequire('luasnip')
local cmp = prequire("cmp")

local kind_icons = {
  Text          = "",   -- Text          = "",
  Method        = "",   -- Method        = "",
  Function      = "",   -- Function      = "",
  Constructor   = "",   -- Constructor   = "",
  Field         = "ﰠ",   -- Field         = "",
  Variable      = "",   -- Variable      = "",
  Class         = "ﴯ",   -- Class         = "ﴯ",
  Interface     = "",   -- Interface     = "ﰮ",
  Module        = "",   -- Module        = "",
  Property      = "ﰠ",   -- Property      = "",
  Unit          = "",   -- Unit          = "",
  Value         = "",   -- Value         = "",
  Enum          = "",   -- Enum          = "ℰ",
  Keyword       = "",   -- Keyword       = "",
  Snippet       = "",   -- Snippet       = "",
  Color         = "",   -- Color         = "",
  File          = "",   -- File          = "",
  Reference     = "",   -- Reference     = "",
  Folder        = "",   -- Folder        = "",
  EnumMember    = "",   -- EnumMember    = "",
  Constant      = "",   -- Constant      = "",
  Struct        = "פּ",   -- Struct        = "פּ",
  Event         = "",   -- Event         = "",
  Operator      = "",   -- Operator      = "",
  TypeParameter = "T",   -- TypeParameter = "𝙏"
}

local has_any_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
    return false
  end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    completion = {
      col_offset = -3,
      side_padding = 0,
    },
    documentation = {
      border = { '╭', '─' ,'╮', '│', '╯', '─', '╰', '│' },
      winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
      max_width = 120,
      max_height = math.floor(vim.o.lines * 0.3),
    },
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      vim_item.abbr = (string.len(vim_item.abbr) > 20) and vim.fn.strcharpart(vim_item.abbr, 0, 20) .. "…" or vim_item.abbr
      vim_item.menu =
      "[".. ({
        buffer = "﬘",
        nvim_lsp = "",
        cmp_tabnine = "",
        luasnip = "",
        emoji = "",
        path = "",
      })[entry.source.name].."] "..vim_item.kind
      vim_item.kind = " " .. kind_icons[vim_item.kind] .. " "
      return vim_item
    end
  },
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
  sources = cmp.config.sources{
    { name = 'luasnip' },
    { name = 'cmp_tabnine' },
    { name = "buffer" },
    { name = "path" },
    { name = "nvim_lsp" },
    { name = 'emoji', options = { insert = true } },
    { name = "buffer", options = {
      get_bufnrs = function()
        local bufs = {}
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          bufs[vim.api.nvim_win_get_buf(win)] = true
        end
        return vim.tbl_keys(bufs)
      end
    }
    },
  },
  mapping = {
    ["<Tab>"] = cmp.mapping(function (fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif has_any_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, {"i", "s"}),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, {"i", "s"}),
    ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({
      behavior = cmp.SelectBehavior.Select
    }), {'i'}),
    ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({
      behavior = cmp.SelectBehavior.Select
    }), {'i'}),
    ['<C-n>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, {'i', 's'}),
    ['<C-p>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, {'i', 's'}),
    ['<C-j>'] = cmp.mapping( function (fallback)
      if luasnip and luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end , {'i', 's'}),
    ['<C-k>'] = cmp.mapping( function (fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end , {'i', 's'}),
    ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i'}),
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i'}),
    -- ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i'}),
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.close(),
      c = cmp.mapping.close()
    }),
    ['<CR>'] = cmp.mapping({
      i = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = false
      }),
    }),
  },
  experimental = {
    ghost_text = true,
  }
})

require("luasnip.loaders.from_snipmate").lazy_load()
