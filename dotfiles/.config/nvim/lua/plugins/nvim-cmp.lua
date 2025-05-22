return {
  --
  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "InsertEnter",
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-emoji',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      local luasnip = require('luasnip')
      local cmp = require("cmp")
      local kind_icons = {
        Array         = "",
        Boolean       = "",
        Class         = "",
        Color         = "",
        Constant      = "",
        Constructor   = "",
        Enum          = "",
        EnumMember    = "",
        Event         = "",
        Field         = "",
        File          = "",
        Folder        = "",
        Function      = "",
        Interface     = "",
        Key           = "",
        Keyword       = "",
        Method        = "",
        Misc          = "",
        Module        = "",
        Namespace     = "",
        Null          = "",
        Number        = "",
        Numeric       = "",
        Object        = "",
        Operator      = "",
        Package       = "",
        Parameter     = "",
        Property      = "",
        Reference     = "",
        Ruler         = "",
        Snippet       = "",
        String        = "",
        Struct        = "",
        Text          = "",
        TypeParameter = "",
        Unit          = "",
        Value         = "",
        Variable      = "",
      }
      local has_any_words_before = function()
        if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
          return false
        end
        local line = vim.api.nvim_win_get_cursor(0)[1]
        local col = vim.api.nvim_win_get_cursor(0)[2]
        return col ~= 0 and
            vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      -- toggle cmp
      local function toggle_autocomplete()
        local current_setting = cmp.get_config().completion.autocomplete
        if current_setting and #current_setting > 0 then
          cmp.setup({ completion = { autocomplete = false } })
          vim.notify('Autocomplete disabled')
        else
          cmp.setup({ completion = { autocomplete = { cmp.TriggerEvent.TextChanged } } })
          vim.notify('Autocomplete enabled')
        end
      end


      vim.api.nvim_create_user_command('CmpToggle', toggle_autocomplete, {})
      vim.keymap.set("n", "<leader>c", toggle_autocomplete, { desc = "toggle autocomplete" })

      cmp.setup {
        completion = {
          completeopt = 'menu,menuone,noinsert',
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          completion = {
            col_offset = -3,
            side_padding = 0,
            winblend = 10
          },
          documentation = {
            border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:HintFloat",
            max_width = 120,
            max_height = math.floor(vim.o.lines * 0.4),
            winblend = 0
          },
        },
        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = function(entry, vim_item)
            local trancate_length = 25
            vim_item.abbr = (string.len(vim_item.abbr) > trancate_length) and
                vim.fn.strcharpart(vim_item.abbr, 0, trancate_length) .. "…"
                or
                vim_item.abbr
            if entry.source.name == "nvim_lsp" then
              vim_item.menu = "[lsp]"
            else
              vim_item.menu = "[" .. entry.source.name .. "]"
            end
            vim_item.kind = " " .. kind_icons[vim_item.kind] .. " "
            return vim_item
          end
        },
        sources = cmp.config.sources {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
          -- { name = 'buffer' },
          -- { name = 'emoji',   options = { insert = true } },
        },
        mapping = {
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif has_any_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { "i", "s" }),
          ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({
            behavior = cmp.SelectBehavior.Select
          }), { 'i' }),
          ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({
            behavior = cmp.SelectBehavior.Select
          }), { 'i' }),
          ['<C-n>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<C-p>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<C-j>'] = cmp.mapping(function(fallback)
            if luasnip and luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<C-k>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i' }),
          ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i' }),
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
          ghost_text = {
            hl_group = "LspCodeLens",
          },
        }
      }
    end
  },
}
