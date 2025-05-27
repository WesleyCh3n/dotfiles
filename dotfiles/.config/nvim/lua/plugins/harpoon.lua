return {
  -- harpoon
  {
    "ThePrimeagen/harpoon",
    opts = {},
    keys = {
      { '<leader>a', function() require("harpoon.mark").add_file() end,        desc = "Harpoon next", },
      { '<leader>h', function() require("harpoon.ui").toggle_quick_menu() end, desc = "Harpoon ui", },
      { '<C-n>',     function() require("harpoon.ui").nav_next() end,          desc = "harpoon next" },
      { '<C-p>',     function() require("harpoon.ui").nav_prev() end,          desc = "harpoon prev" },
      { '<leader>1', function() require("harpoon.ui").nav_file(1) end,         desc = "Harpoon 1" },
      { '<leader>2', function() require("harpoon.ui").nav_file(2) end,         desc = "Harpoon 2" },
      { '<leader>3', function() require("harpoon.ui").nav_file(3) end,         desc = "Harpoon 3" },
    }
  },
}
