local on_attach = function(client, bufnr)
  local picker = require("snacks").picker
  -- go to definitions
  vim.keymap.set('n', 'gf', function()
    picker.lsp_definitions {}
  end, { buffer = bufnr, noremap = true, silent = true, desc = "definitions" })

  -- list references
  vim.cmd [[silent! umap grr]]
  vim.keymap.set('n', 'grr', function()
    picker.lsp_references {}
  end, { buffer = bufnr, noremap = true, silent = true, desc = "vim.lsp.buf.references()" })

  -- definitions
  vim.keymap.set('n', 'K', function()
    vim.lsp.buf.hover({
      border = "rounded",
    })
  end, { buffer = bufnr })

  -- diagnostic
  vim.keymap.set("n", 'gl', function()
    picker.diagnostics { severity_bound = 0, bufnr = nil }
  end, { buffer = bufnr, noremap = true, silent = true, desc = "diagnostics" })
  vim.keymap.set('n', 'gx', '<cmd>lua vim.diagnostic.open_float()<cr>',
    { buffer = bufnr, noremap = true, silent = true, desc = "diagnostic expand" })
  vim.keymap.set('n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<CR>',
    { buffer = bufnr, noremap = true, silent = true, desc = "diagnostic next" })
  vim.keymap.set('n', 'gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>',
    { buffer = bufnr, noremap = true, silent = true, desc = "diagnostic prev" })

  -- code action
  vim.cmd [[silent! umap gra]]
  vim.keymap.set('n', 'gra', '<cmd>lua vim.lsp.buf.code_action()<cr>',
    { buffer = bufnr, noremap = true, silent = true, desc = "vim.lsp.buf.code_action()" })

  if client.server_capabilities.documentSymbolProvider then
    require("nvim-navic").attach(client, bufnr)
  end
  require "lsp_signature".on_attach({
    bind = true,
    hint_enable = false,
  }, bufnr)
end

return {
  {
    "mason-org/mason-lspconfig.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      { "mason-org/mason.nvim", opts = { ui = { border = "rounded" } } },
      "neovim/nvim-lspconfig",
      "ray-x/lsp_signature.nvim"
    },
    keys = { { "<leader>m", "<cmd>Mason<cr>", desc = "Mason" } },
    opts = {},
    config = function()
      local servers = {
        tinymist = {
          cmd = { "tinymist" },
          filetypes = { "typst" },
          settings = {
            formatterMode = "typstyle",
            exportPdf = "onType",
            semanticTokens = "disable"
          }
        },
        pyright = {
          pyright = {
            disableOrganizeImports = true, -- Using Ruff
          },
          python = {
            analysis = {
              ignore = { '*' },         -- Using Ruff
              typeCheckingMode = 'off', -- Using mypy
            },
          },
        },
        ruff = {
          capabilities = {
            general = {
              positionEncodings = { "utf-16" }
            },
          }
        },
        ts_ls = {},
        tailwindcss = {},
        bashls = {},
        clangd = {
          filetypes = { "c", "cpp", "cuda" },
        },
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim", "Snacks" },
              },
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },
      }
      vim.diagnostic.config {
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.INFO] = " ",
            [vim.diagnostic.severity.HINT] = " ",
          },
        },
        underline = true,
        update_in_insert = false,
        virtual_text = true,
        -- virtual_lines = {
        --   current_line = true, // wierd line indicator
        -- },
        severity_sort = true,
        float = {
          source = "if_many",
          focusable = true,
          border = "rounded",
          severity_sort = true,
        },
      }

      -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      local mason = require('mason')
      local mason_lspconfig = require('mason-lspconfig')
      mason.setup()
      mason_lspconfig.setup {
        automatic_enable = false, -- NOTE: use vim.lsp.config and vim.lsp.enable myself
        ensure_installed = vim.tbl_keys(servers),
      }
      vim.lsp.config("*", {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      for server, _ in pairs(servers) do
        vim.lsp.config(server, servers[server])
        vim.lsp.enable(server)
      end
    end
  },

  {
    "stevearc/aerial.nvim",
    opts = {
      layout = {
        min_width = 30,
      },
      filter_kind = {
        "Array",
        "Boolean",
        "Class",
        "Constant",
        "Constructor",
        "Enum",
        "EnumMember",
        "Event",
        "Field",
        "File",
        "Function",
        "Interface",
        "Key",
        "Method",
        "Module",
        "Namespace",
        "Null",
        "Number",
        "Object",
        "Operator",
        "Package",
        "Property",
        "String",
        "Struct",
        "TypeParameter",
        "Variable",
      },
    },
    keys = {
      { "<space>o", "<cmd>AerialToggle!<cr>", desc = "Outline" },
    },
  },
}
