local on_attach = function(client, bufnr)
  vim.api.nvim_create_user_command('LspRestartAll', function()
    vim.lsp.stop_client(vim.lsp.get_clients())
  end, {
    desc = 'Restart All Lsp client',
  })

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
end

return {
  {
    "mason-org/mason-lspconfig.nvim",
    event = { "BufNewFile", "BufReadPost", "BufReadPre" },
    dependencies = {
      { "mason-org/mason.nvim", opts = { ui = { border = "rounded" } } },
      "neovim/nvim-lspconfig",
    },
    keys = {
      { "<leader>m", "<cmd>Mason<cr>", desc = "Mason" },
      {
        "<leader>r",
        function()
          vim.lsp.stop_client(vim.lsp.get_clients())
          vim.defer_fn(function()
            vim.cmd.e() -- restart lsp client
          end, 500)     -- wait for client stopped
        end,
        desc = "Restart Lsp client"
      },
    },
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
          settings = {
            pyright = {
              disableOrganizeImports = true, -- Using Ruff
            },
            python = {
              analysis = {
                -- ignore = { '*' }, -- Using Ruff
                -- typeCheckingMode = 'off', -- Using mypy
              },
            },
          },
        },
        ruff = {
          settings = {
            capabilities = {
              general = {
                positionEncodings = { "utf-16" }
              },
            }
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

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)

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
}
