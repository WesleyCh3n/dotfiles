local M = {}

M.on_attach = function(client, bufnr)
  -- local opts = { buffer = bufnr, noremap = true, silent = true }
  local telescope = require("telescope.builtin")
  -- go to definitions
  vim.keymap.set('n', 'gf', function()
    telescope.lsp_definitions {}
  end, { buffer = bufnr, noremap = true, silent = true, desc = "definitions" })
  -- vim.keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', { buffer = bufnr, noremap = true, silent = true })

  -- reference
  vim.keymap.set('n', 'gr', function()
    telescope.lsp_references {}
  end, { buffer = bufnr, noremap = true, silent = true, desc = "reference" })

  -- definitions
  vim.keymap.set('n', 'K', function()
    vim.lsp.buf.hover()
  end, { buffer = bufnr, noremap = true, silent = true, desc = "hover" })
  -- vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { buffer = bufnr, noremap = true, silent = true })

  -- diagnostic
  vim.keymap.set("n", 'gl', function()
    telescope.diagnostics { severity_bound = 0, bufnr = nil }
  end, { buffer = bufnr, noremap = true, silent = true, desc = "diagnostics" })
  vim.keymap.set('n', 'gs', '<cmd>lua vim.diagnostic.open_float()<cr>',
    { buffer = bufnr, noremap = true, silent = true, desc = "diagnostic expand" })
  vim.keymap.set('n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<CR>',
    { buffer = bufnr, noremap = true, silent = true, desc = "diagnostic next" })
  vim.keymap.set('n', 'gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>',
    { buffer = bufnr, noremap = true, silent = true, desc = "diagnostic prev" })

  -- refactor
  vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<cr>',
    { buffer = bufnr, noremap = true, silent = true, desc = "code action" })
  vim.keymap.set('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>',
    { buffer = bufnr, noremap = true, silent = true, desc = "rename" })

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
