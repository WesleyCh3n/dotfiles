local vault_path = os.getenv("HOME") .. "/Documents/notes"
local vault_exist = vim.uv.fs_stat(vault_path)

local keymaps = {
  {
    "<leader>on",
    function()
      vim.ui.input({ prompt = "Note title" }, function(input)
        if input == nil or input == "" then
          return
        end
        local file_name = string.gsub(input, "%s", "-")
        local date = os.date("%Y-%m-%d")
        local formatted_file_name = date .. "_" .. file_name .. ".md"
        local full_path = vault_path .. "/inbox/" .. formatted_file_name
        vim.cmd("e " .. full_path)

        vim.cmd("ObsidianTemplate note")        -- apply template
        vim.cmd("norm! GVd")                    -- delete last empty line
        vim.cmd([[silent! s/\(# \)[^_]*_/\1/]]) -- add & remove date
        vim.cmd([[silent! s/-/ /g]])            -- replace - with space
        vim.cmd([[norm! _w~]])                  -- first char capital
        vim.cmd("norm! 6ggf]")                  -- find insert position in categories
        vim.fn.setreg("/", "")
        vim.api.nvim_feedkeys("i", "n", false)  -- start insert mode
      end)
    end,
    desc = "Create new note",
  },
  {
    "<leader>or",
    function()
      local uv = vim.loop
      local inbox = vault_path .. "/inbox"
      local handle = uv.fs_scandir(inbox)

      local md_files = {}
      while true do
        local name, t = uv.fs_scandir_next(handle)
        if not name then break end
        if t == "file" and name:match("%.md$") then
          table.insert(md_files, inbox .. "/" .. name)
        end
      end

      if #md_files == 0 then
        vim.notify("No .md files found in: " .. inbox)
        return
      end

      for _, filepath in ipairs(md_files) do
        vim.cmd("edit " .. vim.fn.fnameescape(filepath))
      end
    end,
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
    "<leader>odd",
    function()
      local file_path = vim.fn.expand("%:p")
      os.remove(file_path)
      vim.cmd("bd")
    end,
    desc = "Remove note"
  }
}

return {
  {
    "epwalsh/obsidian.nvim",
    enabled = vault_exist,
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = function()
      if not vault_exist then
        return {}
      end
      return keymaps
    end,
    opts = {
      ui = {
      },
      notes_subdir = "inbox",
      disable_frontmatter = true,
      workspaces = {
        {
          name = "personal",
          path = vault_path,
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
