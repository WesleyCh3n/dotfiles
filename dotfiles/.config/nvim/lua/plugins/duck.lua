return {
  --
  {
    'tamton-aquib/duck.nvim',
    lazy = true,
    keys = {
      { '<space>dd', function() require("duck").hatch() end, desc = "DUCK!!!", },
      { '<space>dc', function() require("duck").hatch("🐈") end, desc = "CAT!!!", },
      { '<space>dk', function() require("duck").cook() end, desc = "COOK ANIMAL", }
    },
  },
}
