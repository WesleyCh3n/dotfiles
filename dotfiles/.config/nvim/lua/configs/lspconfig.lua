-- nvim-lsp-installer
local present, lsp_installer = pcall(require, "nvim-lsp-installer")
if not present then
  return
end

local lspconfig_window = require("lspconfig.ui.windows")
local old_defaults = lspconfig_window.default_opts

function lspconfig_window.default_opts(opts)
  local win_opts = old_defaults(opts)
  win_opts.border = "rounded"
  return win_opts
end

local on_attach = function(client,bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)
  buf_set_keymap('n', '<space>rr', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  -- buf_set_keymap('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
  -- buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- buf_set_keymap('n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  -- buf_set_keymap('n', 'gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  -- buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- buf_set_keymap('n', '<space>fa', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  -- buf_set_keymap('n', '<leader>dd', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
  -- buf_set_keymap('n', '<space>o', ':SymbolsOutline<CR>', opts)

  vim.keymap.set('n', 'gr', require("lspsaga.finder").lsp_finder, opts)
  vim.keymap.set('n', 'gs', require("lspsaga.signaturehelp").signature_help, opts)
  vim.keymap.set('n', 'K', require("lspsaga.hover").render_hover_doc, opts)
  vim.keymap.set('n', '<space>fa', require("lspsaga.codeaction").code_action, opts)
  vim.keymap.set('n', '<space>rn', require("lspsaga.rename").lsp_rename, opts)
  vim.keymap.set('n', '<leader>dd', require("lspsaga.diagnostic").show_line_diagnostics, opts)
  vim.keymap.set('n', 'gn', require("lspsaga.diagnostic").goto_next, opts)
  vim.keymap.set('n', 'gp', require("lspsaga.diagnostic").goto_prev, opts)

  require('illuminate').on_attach(client)
  require("lsp_signature").on_attach({
    bind = true,
    hint_prefix = "🐈 ",
    floating_window_above_cur_line = true,
    hi_parameter = 'WarningMsg',
    handler_opts = { border = 'rounded' },
  })
end

local servers = {
  "pylsp",
  "gopls",
  "tsserver",
  "tailwindcss",
  "bashls",
  "clangd",
  "sumneko_lua",
  "rust_analyzer"
}

--[[ auto install required lsp server ]]
for _, name in pairs(servers) do
  local server_available, server = lsp_installer.get_server(name)
  if server_available then
    server:on_ready(function ()
      local default_opts = {
        on_attach = on_attach,
      }
      if name == 'pylsp' then
        default_opts = {
          on_attach = on_attach,
          settings = {
            pylsp = {
              plugins = {
                jedi = {
                  environment = vim.g.pylsp_jedi_environment or vim.fn.exepath('python3'),
                },
              },
            },
          },
        }
      end
      if name == 'sumneko_lua' then
        default_opts = {
          on_attach = on_attach,
          settings = {Lua = {diagnostics = {globals = {'vim'}}}},
        }
      end
      server:setup(default_opts)
    end)
    if not server:is_installed() then
      server:install()
    end
  end
end

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

-- local border = { {"╭"}, {"─"}, {"╮"}, {"│"}, {"╯"}, {"─"}, {"╰"}, {"│"} }

vim.diagnostic.config({
  float = {
    source = 'if_many',
    focusable = true,
    border = 'rounded',
    severity_sort = true
  },
})

--
-- local signs = { Error = "", Warn = "", Hint = "", Info = "" }
local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "Diagnostic" .. type
  local sign = "DiagnosticSign" .. type
  vim.fn.sign_define(sign, { text = icon, texthl = hl, numhl = hl })
end
