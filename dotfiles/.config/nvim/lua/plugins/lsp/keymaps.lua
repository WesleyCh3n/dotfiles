local M = {}

M.on_attach = function(client, bufnr)
  local opts = { buffer = bufnr, noremap = true, silent = true }
  local telescope = require("telescope.builtin")
  -- go to definitions
  vim.keymap.set('n', 'gf', function()
    telescope.lsp_definitions {}
  end, opts)
  -- vim.keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)
  -- vim.keymap.set('n', '<space>rr', '<cmd>lua vim.lsp.buf.format(opts)<CR>', opts)

  -- reference
  vim.keymap.set('n', 'gr', function()
    telescope.lsp_references {}
  end, opts)

  -- definitions
  vim.keymap.set('n', 'K', function()
    vim.lsp.buf.hover()
  end, opts)
  -- vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

  -- diagnostic
  vim.keymap.set("n", 'gl', function()
    telescope.diagnostics { severity_bound = 0, bufnr = nil }
  end, opts)
  vim.keymap.set('n', 'gs', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
  vim.keymap.set('n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  vim.keymap.set('n', 'gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)

  -- refactor
  vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  vim.keymap.set('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

  if client.server_capabilities.documentSymbolProvider then
    require("nvim-navic").attach(client, bufnr)
  end
  require("lsp_signature").on_attach({
    bind = true,
    hint_enable = false,
    hint_prefix = "🐈 ",
    floating_window_above_cur_line = true,
    hi_parameter = 'WarningMsg',
    handler_opts = { border = 'rounded' },
  })
end

return M
