return {
  --
  {
    'iamcco/markdown-preview.nvim',
    enabled = false,
    ft = "markdown",
    lazy = true,
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    keys = {
      { '<leader>p', '<cmd>MarkdownPreviewToggle<cr>', desc = 'Markdown preview' },
    },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
  },
}
