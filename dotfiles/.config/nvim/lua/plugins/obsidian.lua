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
      {
        "<leader>on",
        function()
          vim.ui.input({ prompt = "Note title" }, function(title)
            local file_name = string.gsub(title, "%s", "-")
            local date = os.date("%Y-%m-%d")
            local formatted_file_name = date .. "_" .. file_name .. ".md"
            local full_path = vault_path .. "/inbox/" .. formatted_file_name
            vim.cmd("e " .. full_path)

            vim.cmd("ObsidianTemplate note")
            vim.cmd("norm! GVd")                    -- delete last empty line
            vim.cmd([[silent! s/\(# \)[^_]*_/\1/]]) -- add & remove date
            vim.cmd([[silent! s/-/ /g]])            -- replace - with space
            vim.cmd([[norm! _w~]])                  -- first char capital
            vim.cmd("norm! 6ggf]")                  -- find insert position in categories
            vim.api.nvim_feedkeys("i", "n", false)  -- start insert mode
            vim.fn.setreg("/", "")
          end)
        end,
        desc = "Create new note",
      },
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
