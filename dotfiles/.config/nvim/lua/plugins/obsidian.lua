return {
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { '<leader>ot', ":ObsidianTemplate note<cr>GVd:.s/\\(# \\)[^_]*_/\\1/ | s/-/ /g<cr>:let @/ = \"\"<cr>", desc = "Apply note template", },
    },
    opts = {
      ui = {
        -- enable = false
      },
      notes_subdir = "inbox",
      disable_frontmatter = true,
      workspaces = {
        {
          name = "personal",
          path = "~/Documents/notes",
        },
      },
      templates = {
        subdir = "templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M:%S",
      },
    },
  }
}
