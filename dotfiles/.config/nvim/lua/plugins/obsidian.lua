local uv = vim.uv
local vault_path = os.getenv("HOME") .. "/Documents/notes"
local vault_exist = uv.fs_stat(vault_path)

local function get_markdown_files(path)
  local handle = uv.fs_scandir(path)

  local md_files = {}
  while true do
    local name, t = uv.fs_scandir_next(handle)
    if not name then break end
    if t == "file" and name:match("%.md$") then
      table.insert(md_files, path .. "/" .. name)
    end
  end
  return md_files
end

local keymaps = {
  { "<leader>oo", function() Snacks.picker.files { dirs = { vault_path }, follow = true, ignored = true } end, desc = "Open vault files" },
  { "<leader>ob", ":Obsidian open<cr>",                                                                        desc = "Open current note" },
  { "<leader>os", ":Obsidian search<cr>",                                                                      desc = "Grep note" },
  { "<leader>ot", ":Obsidian tags<cr>",                                                                        desc = "Tags list" },
  { "<leader>ol", ":Obsidian paste_image<cr>",                                                                 desc = "Paste image (clipboard)" },
  { "gd",         ":Obsidian follow_links<cr>",                                                                desc = "Follow links" },
  { "gra",        ":Obsidian backlinks<cr>",                                                                   desc = "Backlinks" },
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
        vim.cmd("norm! _wvgU")                  -- first char capital
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
      local inbox = vault_path .. "/inbox"
      local md_files = get_markdown_files(inbox)

      if #md_files == 0 then
        vim.notify("No .md files found in: " .. inbox)
        return
      end

      for _, filepath in ipairs(md_files) do
        vim.cmd("edit " .. vim.fn.fnameescape(filepath))
      end
    end,
    desc = "Review notes (inbox)",
  },
  { "<leader>ol", ":ObsidianTemplate note", desc = "Apply template" },
  {
    "<leader>og",
    function()
      os.execute("mkdir " .. vault_path .. "/zettelkasten/")
      local file_path = vim.fn.expand("%:p")
      local target_path = vault_path .. "/zettelkasten/" .. vim.fn.fnamemodify(file_path, ":t")
      os.execute("mv " .. vim.fn.shellescape(file_path) .. " " .. vim.fn.shellescape(target_path))
      vim.cmd("bd")
    end,
    desc = "Move zettelkasten"
  },
  {
    "<leader>odd",
    function()
      vim.ui.select({ "y", "n" }, {
        prompt = "Do you want to delete current file (" .. vim.fn.expand("%:t") .. ")?",
      }, function(choice)
        if choice == "y" then
          local file_path = vim.fn.expand("%:p")
          vim.cmd("bd!")
          os.remove(file_path)
        end
      end)
    end,
    desc = "Delete note"
  },
  {
    "<leader>oc",
    function()
      local zettelkasten = vault_path .. "/zettelkasten"
      local markdown_files = get_markdown_files(zettelkasten)
      for _, file in ipairs(markdown_files) do
        print("Processing " .. file)

        -- Read file to extract tag (line after "tags:")
        local tag = nil
        local f = io.open(file, "r")
        if f then
          local lines = {}
          for line in f:lines() do table.insert(lines, line) end
          f:close()

          for i = 1, #lines do
            if lines[i]:match("^tags:") and lines[i + 1] then
              tag = lines[i + 1]:gsub("^%s*%-?%s*", ""):gsub("^%s+", ""):gsub("%s+$", "")
              break
            end
          end
        end

        if tag and tag ~= "" then
          print("Found tag: " .. tag)
          local target_dir = vault_path .. "/notes/" .. tag

          -- Create target dir if not exists
          if not uv.fs_stat(target_dir) then
            uv.fs_mkdir(target_dir, 493) -- 0755
          end

          -- Move file
          local filename = file:match("^.+/(.+)$")
          local new_path = target_dir .. "/" .. filename
          local ok, err = os.rename(file, new_path)
          if ok then
            print("Moved " .. file .. " to " .. target_dir)
          else
            vim.notify("Failed to move file: " .. err, vim.log.levels.ERROR)
          end
        else
          vim.notify("No tag found for " .. file, vim.log.levels.WARN)
        end
      end
      vim.notify("Done 🪷")
    end,
    desc = "Classify zettelkasten"
  }
}

return {
  {
    "obsidian-nvim/obsidian.nvim",
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
      ui = {},
      notes_subdir = "inbox",
      disable_frontmatter = true,
      note_id_func = function(title)
        local suffix = ""
        if title ~= nil then
          suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return tostring(os.date("%Y-%m-%d")) .. "-" .. suffix
      end,
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
      picker = {
        name = "snacks.pick",
        note_mappings = {
          -- Create a new note from your query.
          new = "<C-x>",
          -- Insert a link to the selected note.
          insert_link = "<C-l>",
        },
        tag_mappings = {
          -- Add tag(s) to current note.
          tag_note = "<C-x>",
          -- Insert a tag at the current location.
          insert_tag = "<C-l>",
        },
      },
    },
  }
}
