-- nvim-lsp-installer
local present, lsp_installer = pcall(require, "nvim-lsp-installer")
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
  buf_set_keymap('n', '<space>fa', '<cmd>lua require("telescope.builtin").lsp_code_actions()<cr>', opts)
  buf_set_keymap('n', '<space>l', '<cmd>lua require("telescope.builtin").diagnostics(require("telescope.themes").get_ivy({prompt_prefix = " ", path_display = { tail=1 }, layout_config = { height = 0.3, preview_width=0.4 }}))<CR>', opts)
  buf_set_keymap('n', '<leader>dd', '<cmd>lua vim.diagnostic.open_float(nil,{border = {{"╭",},{"─"},{"╮"},{"│"},{"╯"},{"─"},{"╰"},{"│"}},focusable=false,source="if_many"})<cr>', opts)
  -- vim.cmd [[autocmd CursorHold,CursorHoldI * ]]
  require('illuminate').on_attach(client)
  require("lsp_signature").on_attach({
    bind = true,
    handler_opts = { border = 'rounded' },
    floating_window_above_cur_line = true,
    doc_lines = 0,
    hint_prefix = "🐱 ",
  })
end

local servers = {
  "pyright",
  "gopls",
  "tsserver",
  "bashls",
  "clangd",
  -- "sumneko_lua"
}

--[[ auto install required lsp server ]]
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

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = {
      spacing = 4,
      prefix = ''
    }
  }
)

vim.api.nvim_command("hi DiagnosticError guifg=#db4b4b")
vim.api.nvim_command("hi DiagnosticWarn  guifg=#e0af68")
vim.api.nvim_command("hi DiagnosticInfo  guifg=#0db9d7")
vim.api.nvim_command("hi DiagnosticHint  guifg=#10B981")

vim.api.nvim_command("hi DiagnosticVirtualTextError guifg=#db4b4b")
vim.api.nvim_command("hi DiagnosticVirtualTextWarn  guifg=#e0af68")
vim.api.nvim_command("hi DiagnosticVirtualTextInfo  guifg=#0db9d7")
vim.api.nvim_command("hi DiagnosticVirtualTextHint  guifg=#10B981")

-- local signs = { Error = "", Warn = "", Hint = "", Info = "" }
local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "Diagnostic" .. type
  local sign = "DiagnosticSign" .. type
  vim.fn.sign_define(sign, { text = icon, texthl = hl, numhl = hl })
end
