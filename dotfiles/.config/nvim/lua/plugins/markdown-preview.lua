return {
  --
  {
    'iamcco/markdown-preview.nvim',
    ft = "markdown",
    lazy = true,
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    keys = {
      { '<space>p', '<cmd>MarkdownPreviewToggle<cr>', desc = 'md preview' },
    },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
  },
}
