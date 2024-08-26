return {
  {
    'L3MON4D3/LuaSnip',
    -- version = "1.*",
    config = function()
      require("luasnip.loaders.from_snipmate").lazy_load()
    end,
    dependencies = {
      { 'honza/vim-snippets' },
    }
  },
}
