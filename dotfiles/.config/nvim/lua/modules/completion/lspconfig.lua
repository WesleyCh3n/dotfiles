require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})
local servers = {
  "pyright",
  "tsserver",
  "tailwindcss",
  "bashls",
  "clangd",
  "rust_analyzer",
  -- "lua-language-server",
  -- "gopls",
}
require("mason-lspconfig").setup {
  ensure_installed = servers,
}

local lspconfig_window = require("lspconfig.ui.windows")
local old_defaults = lspconfig_window.default_opts

function lspconfig_window.default_opts(opts)
  local win_opts = old_defaults(opts)
  win_opts.border = "rounded"
  return win_opts
end

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local opts = { noremap = true, silent = true }
  buf_set_keymap('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)
  buf_set_keymap('n', '<space>rr', '<cmd>lua vim.lsp.buf.format({async=true})<CR>', opts)

  buf_set_keymap('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
  buf_set_keymap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', 'gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>fa', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  buf_set_keymap('n', '<leader>dd', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)

  if client.server_capabilities.documentSymbolProvider then
    require("nvim-navic").attach(client, bufnr)
  end
  require('illuminate').on_attach(client)
  require("lsp_signature").on_attach({
    bind = true,
    hint_prefix = "🐈 ",
    floating_window_above_cur_line = true,
    hi_parameter = 'WarningMsg',
    handler_opts = { border = 'rounded' },
  })
end

local status, lspconfig = pcall(require, "lspconfig")
if (not status) then return end

lspconfig.pyright.setup({ on_attach = on_attach })
lspconfig.gopls.setup({ on_attach = on_attach })
lspconfig.tsserver.setup({ on_attach = on_attach })
lspconfig.tailwindcss.setup({ on_attach = on_attach })
lspconfig.bashls.setup({ on_attach = on_attach })
lspconfig.clangd.setup({ on_attach = on_attach })
lspconfig.lua_ls.setup({
  on_attach = on_attach,
  settings = { Lua = { diagnostics = { globals = { 'vim' } } } },
})


--[[ auto install required lsp server ]]
-- for _, name in pairs(servers) do
--   local server_available, server = lsp_installer.get_server(name)
--   if server_available then
--     server:on_ready(function()
--       local default_opts = {
--         on_attach = on_attach,
--       }
--       if name == 'sumneko_lua' then
--         default_opts = {
--           on_attach = on_attach,
--           settings = { Lua = { diagnostics = { globals = { 'vim' } } } },
--         }
--       end
--       if name ~= 'rust_analyzer' then
--         server:setup(default_opts)
--       end
--       -- if name == 'rust_analyzer' then
--       --   default_opts = {
--       --     on_attach = on_attach,
--       --     settings = {
--       --       inlayHints = {
--       --         maxLength = nil,
--       --         typeHints = {
--       --           enable = true,
--       --         }
--       --       },
--       --       checkOnSave = {
--       --         command = "clippy",
--       --       },
--       --     },
--       --   }
--       -- end
--     end)
--     if not server:is_installed() then
--       server:install()
--     end
--   end
-- end

require("rust-tools").setup({
  tools = {
    runnables = {
      use_telescope = true,
    },
  },
  server = {
    on_attach = on_attach,
    settings = {
      ["rust-analyzer"] = {
        inlayHints = { locationLinks = false },
        checkOnSave = {
          command = "clippy",
        },
      },
    },
  },
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  virtual_text = {
    spacing = 4,
    prefix = ''
  }
}
)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.diagnostic.config({
  float = {
    source = 'if_many',
    focusable = true,
    border = 'rounded',
    severity_sort = true
  },
})

local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "Diagnostic" .. type
  local sign = "DiagnosticSign" .. type
  vim.fn.sign_define(sign, { text = icon, texthl = hl, numhl = hl })
end
