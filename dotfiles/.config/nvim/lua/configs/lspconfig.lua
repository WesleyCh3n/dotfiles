local present, lsp = pcall(require, "lspconfig")
if not present then
  return
end

local on_attach = function(client,bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', 'gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua require("renamer").rename()<CR>', opts)
  buf_set_keymap('n', '<space>l', '<cmd>Telescope diagnostics<CR>', opts)

  -- buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  -- buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- buf_set_keymap('n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  -- buf_set_keymap('n', 'gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- buf_set_keymap('n', '<space>l', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil,{border = {{"╭", },{"─"},{"╮"},{"│"},{"╯"},{"─"},{"╰"},{"│"}},focusable=false,scope="line",header="",source="if_many"})]]
  require("lsp_signature").on_attach({
    bind = true,
    handler_opts = { border = 'rounded' },
    floating_window_above_cur_line = true,
    doc_lines = 0,
    hint_prefix = "🐱 ",
  })
end

-- nvim-lsp-installer
local lsp_installer = require("nvim-lsp-installer")

local servers = {
  "pyright",
  "gopls",
  "tsserver",
  "bashls"
}

for _, name in pairs(servers) do
  local server_available, server = lsp_installer.get_server(name)
  if server_available then
    server:on_ready(function ()
      local default_opts = {
        on_attach = on_attach,
      }
      server:setup(default_opts)
    end)
    if not server:is_installed() then
      server:install()
    end
  end
end


-- lspconfig

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  float = {
    show_header = false,
    source = "if_many",
  },
  update_in_insert = false,
  severity_sort = true,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
