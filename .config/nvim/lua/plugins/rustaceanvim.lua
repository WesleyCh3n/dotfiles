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
end

return {
  {
    'mrcjkb/rustaceanvim',
    version = '^6', -- Recommended
    init = function()
      vim.g.rustaceanvim = {
        server = {
          on_attach = on_attach,
        }
      }
    end,
    lazy = false, -- This plugin is already lazy
  }
}
