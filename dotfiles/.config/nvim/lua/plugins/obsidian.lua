local vault_path = os.getenv("HOME") .. "/Documents/notes"
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
      { "<leader>ot", ":ObsidianTemplate note<cr>GVd:.s/\\(# \\)[^_]*_/\\1/ | s/-/ /g<cr>:let @/ = \"\"<cr>", desc = "Apply note template", },
      {
        "<leader>or",
        ":next " .. vault_path .. "/inbox/*.md<cr>",
        desc = "Review notes",
      },
      {
        "<leader>og",
        function()
          local file_path = vim.fn.expand("%:p")
          local target_path = vault_path .. "/zettelkasten/" .. vim.fn.fnamemodify(file_path, ":t")
          os.execute("mv " .. vim.fn.shellescape(file_path) .. " " .. vim.fn.shellescape(target_path))
          vim.cmd("bd")
        end,
        desc = "Move to zettelkasten"
      },
      {
        "<leader>oD",
        function()
          local file_path = vim.fn.expand("%:p")
          os.remove(file_path)
          vim.cmd("bd")
        end,
        desc = "Remove note"
      }
    },
    opts = {
      ui = {
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
