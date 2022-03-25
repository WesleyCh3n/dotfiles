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
  buf_set_keymap('n', '<space>fa', '<cmd>Telescope lsp_code_actions<cr>', opts)
  buf_set_keymap('n', '<space>l', '<cmd>Telescope diagnostics<CR>', opts)
  buf_set_keymap('n', '<leader>dd', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
  buf_set_keymap('n', '<space>rr', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  require('illuminate').on_attach(client)
  require("lsp_signature").on_attach({
    bind = true,
    hint_prefix = "🐈 ",
    floating_window_above_cur_line = true,
    -- doc_lines = 1,
    hi_parameter = 'WarningMsg',
    handler_opts = { border = 'rounded' },
  })
end

local servers = {
  "pyright",
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

vim.api.nvim_command("hi DiagnosticError guifg=#ea6962")
vim.api.nvim_command("hi DiagnosticWarn  guifg=#d8a657")
vim.api.nvim_command("hi DiagnosticInfo  guifg=#7daea3")
vim.api.nvim_command("hi DiagnosticHint  guifg=#a9b665")

vim.api.nvim_command("hi DiagnosticVirtualTextError guifg=#ea6962")
vim.api.nvim_command("hi DiagnosticVirtualTextWarn  guifg=#d8a657")
vim.api.nvim_command("hi DiagnosticVirtualTextInfo  guifg=#7daea3")
vim.api.nvim_command("hi DiagnosticVirtualTextHint  guifg=#a9b665")

vim.api.nvim_command([[
hi ErrorFloat   guifg=#ea6962 guibg=NONE
hi WarningFloat guifg=#d8a657 guibg=NONE
hi InfoFloat    guifg=#7daea3 guibg=NONE
hi HintFloat    guifg=#a9b665 guibg=NONE

hi NormalFloat  guifg=#ddc7a1 guibg=NONE
]])

--
-- local signs = { Error = "", Warn = "", Hint = "", Info = "" }
local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "Diagnostic" .. type
  local sign = "DiagnosticSign" .. type
  vim.fn.sign_define(sign, { text = icon, texthl = hl, numhl = hl })
end
