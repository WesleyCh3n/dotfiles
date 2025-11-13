return {
  {
    -- highlight other uses of the word under the cursor
    'RRethy/vim-illuminate',
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      delay = 200,
      filetypes_denylist = { 'neo-tree', 'alpah' },
    },
    config = function(_, opts)
      require("illuminate").configure(opts)
    end,
    keys = {}
  },
}
