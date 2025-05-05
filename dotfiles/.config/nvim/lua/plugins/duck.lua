return {
  --
  {
    'tamton-aquib/duck.nvim',
    lazy = true,
    keys = {
      { '<leader>dd', function() require("duck").hatch() end, desc = "DUCK!!!", },
      { '<leader>dc', function() require("duck").hatch("🐈") end, desc = "CAT!!!", },
      { '<leader>dk', function() require("duck").cook() end, desc = "COOK ANIMAL", }
    },
  },
}
