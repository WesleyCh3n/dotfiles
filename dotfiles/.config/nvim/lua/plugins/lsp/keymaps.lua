local M = {}

M.on_attach = function(client, bufnr)
  local telescope = require("telescope.builtin")
  -- go to definitions
  vim.keymap.set('n', 'gf', function()
    telescope.lsp_definitions {}
  end, { buffer = bufnr, noremap = true, silent = true, desc = "definitions" })

  -- definitions
  vim.keymap.set('n', 'K', function()
    vim.lsp.buf.hover({
      border = "rounded",
    })
  end, { buffer = bufnr })

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
  -- vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<cr>',
  --   { buffer = bufnr, noremap = true, silent = true, desc = "code action" })
  -- vim.keymap.set('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>',
  --   { buffer = bufnr, noremap = true, silent = true, desc = "rename" })

  if client.server_capabilities.documentSymbolProvider then
    require("nvim-navic").attach(client, bufnr)
  end
end

return M
