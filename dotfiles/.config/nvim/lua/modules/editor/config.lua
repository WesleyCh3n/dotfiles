local config = {}

function config.telescope()
  local actions = require("telescope.actions")
  require('telescope').setup {
    defaults = {
      prompt_prefix = " ",
      sorting_strategy = "ascending",
      layout_config = {
        horizontal = {
          prompt_position = 'top',
          preview_width = 0.6,
        },
      },
      mappings = {
        i = {
          ["<esc>"] = actions.close,
          ["<C-\\>"] = actions.close,
          ["<Tab>"] = actions.move_selection_next,
          ["<S-Tab>"] = actions.move_selection_previous,
          -- ["<CR>"] = actions.select_tab,
        },
        n = {
          ["q"] = actions.close,
        },
      },
      file_ignore_patterns = {
        "node_modules/*",
        ".git/*"
      }
    },
    pickers = {
      find_files = {
        -- theme = "ivy",
        hidden = true,
        layout_config = {
          -- height = 0.6,
          -- preview_width=0.6
        }
      },
      diagnostics = {
        theme = "dropdown",
        -- path_display = "tail",
      },
      lsp_definitions = require("telescope.themes").get_cursor({
        -- jump_type="never",
        layout_config = {
          width = 0.8,
          height = 0.5,
          preview_width = 0.8,
        },
      }),
      lsp_code_actions = require("telescope.themes").get_cursor({
      }),
      buffers = {
        theme = "dropdown",
        show_all_buffers = true,
        ignore_current_buffer = true,
        mappings = {
          n = {
            ["dd"] = "delete_buffer",
          }
        }
      }
    },
  }
end

function config.treesitter()
  local present, ts = pcall(require, "nvim-treesitter.configs")
  if not present then
    return
  end
  ts.setup {
    ensure_installed = {
      "python",
      "html",
      "c",
      "cpp",
      "rust",
      "css",
      "vim",
      "lua",
      "bash",
      "go",
      "javascript",
      "typescript",
      "tsx",
      "markdown",
      "markdown_inline",
    },
    highlight = {
      enable = true,
      use_languagetree = true,
      additional_vim_regex_highlighting = false,
      disable = { "latex", "bash" },
    },
    autopairs = {
      enable = true
    },
    rainbow = {
      enable = true,
      loaded = true,
      extended_mode = true,
      max_file_lines = nil,
    },
    indent = {
      enable = true
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        }
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = "@class.outer",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]["] = "@class.outer",
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[]"] = "@class.outer",
        },
      },
      lsp_interop = {
        enable = true,
        border = 'single',
        peek_definition_code = {
          ["<leader>df"] = "@function.outer",
          ["<leader>dF"] = "@class.outer",
        },
      },
    },
  }
  -- nvim_treesitter folding
  vim.wo.foldmethod = "expr"
  vim.o.foldexpr = "nvim_treesitter#foldexpr()"
  vim.wo.foldenable = false -- can be enabled directly in opened file - using 'zi' - toogle fold
end

function config.zen_mode()
  require("zen-mode").setup {
    plugins = {
      tmux = {
        enabled = false
      }
    }
  }
end

function config.leap()
  require('leap').set_default_keymaps()

  local function get_line_starts(winid)
    local wininfo = vim.fn.getwininfo(winid)[1]
    local cur_line = vim.fn.line('.')

    -- Get targets.
    local targets = {}
    local lnum = wininfo.topline
    while lnum <= wininfo.botline do
      local fold_end = vim.fn.foldclosedend(lnum)
      -- Skip folded ranges.
      if fold_end ~= -1 then
        lnum = fold_end + 1
      else
        if lnum ~= cur_line then table.insert(targets, { pos = { lnum, 1 } }) end
        lnum = lnum + 1
      end
    end
    -- Sort them by vertical screen distance from cursor.
    local cur_screen_row = vim.fn.screenpos(winid, cur_line, 1)['row']
    local function screen_rows_from_cur(t)
      local t_screen_row = vim.fn.screenpos(winid, t.pos[1], t.pos[2])['row']
      return math.abs(cur_screen_row - t_screen_row)
    end

    table.sort(targets, function(t1, t2)
      return screen_rows_from_cur(t1) < screen_rows_from_cur(t2)
    end)

    if #targets >= 1 then
      return targets
    end
  end

  -- Usage:
  function _G.leap_to_line()
    local winid = vim.api.nvim_get_current_win()
    require('leap').leap {
      target_windows = { winid },
      targets = get_line_starts(winid),
    }
  end
end

function config.targets()
  vim.g.targets_aiAI = 'aIAi'
end

function config.autopairs()
  require('nvim-autopairs').setup()
end

function config.surround()
  require("nvim-surround").setup({
    keymaps = {
      visual = "gs",
      visual_line = "gS",
    },
  })
end

function config.tabout()
  require('tabout').setup({
    tabkey = '<A-n>',
    backwards_tabkey = '<A-p>',
  })
end

function config.nvim_tree()
  local tree_cb = require 'nvim-tree.config'.nvim_tree_callback
  -- write/close file
  function _G.CloseBuffer()
    local treeView = require('nvim-tree.view')
    local bufferline = require('bufferline')
    local explorerWindow = treeView.get_winnr()
    if explorerWindow == nil then
      vim.cmd('bdelete! ')
      return
    end
    local wasExplorerOpen = vim.api.nvim_win_is_valid(explorerWindow)
    local bufferToDelete = vim.api.nvim_get_current_buf()
    if (wasExplorerOpen) then
      bufferline.cycle(-1)
    end
    vim.cmd('bdelete! ' .. bufferToDelete)
  end

  require('nvim-tree').setup {
    diagnostics         = {
      enable = true,
    },
    hijack_netrw        = true,
    open_on_tab         = true,
    update_cwd          = false,
    update_focused_file = {
      enable      = true,
      update_root = true,
      ignore_list = {}
    },
    git                 = {
      ignore = false,
    },
    view                = {
      width = 30,
      side = 'left',
      mappings = {
        custom_only = false,
        list = {
          { key = "t", cb = tree_cb("tabnew") },
          { key = "v", cb = tree_cb("vsplit") },
          { key = "h", cb = tree_cb("dir_up") },
          { key = "l", cb = tree_cb("cd") },
        }
      }
    },
    renderer            = {
      indent_markers = {
        enable = true,
      },
      icons = {
        glyphs = {
          git = {
            unstaged = "",
            staged = "",
            unmerged = "",
            renamed = "➜",
            untracked = "",
            deleted = "",
            ignored = "﯏"
          },
          folder = {
            arrow_open = "",
            arrow_closed = "",
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
            symlink_open = "",
          }
        }
      }
    }
  }
end

function config.better_escape()
  require("better_escape").setup {
    mapping = { "jk", "kj", "jj", "kk" }
  }
end

function config.comment()
  require('Comment').setup()
end

function config.hydra()
  local Hydra = require('hydra')
  local function cmd(command)
    return table.concat({ '<Cmd>', command, '<CR>' })
  end

  local hint = [[
┌───────────────────────────────────────────────┐
│                   TELESCOPE                  │
└───────────────────────────────────────────────┘
  _f_: files               _b_: bufs
  _g_: grep                _e_: symbol
  _c_: nvim dots           _d_: dots
  _/_: search              _?_: search history
  _<Space>_: command       _;_: commands history
  _<Enter>_: Telescop      _<Esc>_ / _q_: close
]]
  Hydra({
    name = 'Telescope',
    hint = hint,
    config = {
      color = 'teal',
      invoke_on_body = true,
      hint = {
        position = 'middle',
        border = 'rounded',
      },
    },
    mode = 'n',
    body = '<Leader>t',
    heads = {
      { 'f', cmd 'Telescope find_files' },
      { 'b', cmd 'Telescope buffers previewer=false' },
      { 'g', cmd 'Telescope live_grep' },
      { 'e', cmd 'Telescope symbols' },
      { '/', cmd 'Telescope current_buffer_fuzzy_find' },
      { '<Space>', cmd 'Telescope commands' },
      { '?', cmd 'Telescope search_history' },
      { ';', cmd 'Telescope command_history' },
      { 'c', cmd 'Telescope find_files cwd=~/dotfiles/dotfiles/.config/nvim/lua' },
      { 'd', cmd 'Telescope find_files cwd=~/dotfiles/' },
      { '<Enter>', cmd 'Telescope', { exit = true, desc = 'list all pickers' } },
      { '<Esc>', nil, { exit = true, nowait = true } },
      { 'q', nil, { exit = true, nowait = true } },
    }
  })
  Hydra({
    name = "Change / Resize Window",
    mode = { "n" },
    body = "<C-w>",
    heads = {
      -- resizing window
      { "h", "<C-w>3<" },
      { "l", "<C-w>3>" },
      { "k", "<C-w>2+" },
      { "j", "<C-w>2-" },
      -- equalize window sizes
      { "e", "<C-w>=" },
      { "v", "<C-w>v<C-w>h" },
      -- exit this Hydra
      { "<Esc>", nil, { exit = true, nowait = true } },
    },
  })
end

function config.vim_easy_align()
  vim.g.easy_align_interactive_modes = { 'c', 'l', 'r' }
  vim.g.easy_align_bang_interactive_modes = { 'c', 'l', 'r' }
end

function config.formatter()
  local format_func = function()
    return {
      exe = "dprint",
      args = { "fmt", "--stdin", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
      stdin = true
    }
  end
  require('formatter').setup({
    filetype = {
      markdown = {
        format_func
      },
      typescriptreact = {
        format_func
      },
      typescript = {
        format_func
      },
      javascript = {
        format_func
      },
      javascriptreact = {
        format_func
      },
      python = {
        function()
          return {
            exe = "black",
            args = { '-', '-l', '79' },
            stdin = true,
          }
        end
      }
    }
  })
end

function config.todo_comments()
  require("todo-comments").setup {
    keywords = {
      HACK = { icon = " ", color = "warning", alt = { "QUES" } },
    },
  }
end

return config
