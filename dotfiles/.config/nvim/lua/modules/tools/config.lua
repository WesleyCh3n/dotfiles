local config = {}

function config.todo_comments()
  require("todo-comments").setup {
    keywords = {
      HACK = { icon = " ", color = "warning", alt = { "QUES" } },
    },
  }
end

function config.colorizer()
  require("colorizer").setup()
  vim.cmd("ColorizerAttachToBuffer")
end

function config.toggleterm()
  require("toggleterm").setup{
    size=10,
    direction = 'horizontal',
    shell = (vim.loop.os_uname().sysname ~= "Windows_NT") and vim.o.shell or "nu.exe",
    float_opts = {
      border='curved'
    }
  }
  local Terminal  = require('toggleterm.terminal').Terminal
  local function mycmd(cmd)
    return {
      cmd = cmd,
      direction = 'float',
      hidden = true,
    }
  end
  local lazygit = Terminal:new(mycmd("lazygit"))
  local nnn = Terminal:new(mycmd("nnn"))
  local bpytop = Terminal:new(mycmd("btop"))
  local node = Terminal:new(mycmd("node"))
  local python = Terminal:new(mycmd("python3"))
  function _G._lazygit_toggle() lazygit:toggle() end
  function _G._nnn_toggle() nnn:toggle() end
  function _G._bpytop_toggle() bpytop:toggle() end
  function _G._node_toggle() node:toggle() end
  function _G._python_toggle() python:toggle() end
end

function config.markdown_preview()
  vim.g.mkdp_auto_close = 0
  vim.g.mkdp_port = '8080'
  vim.g.mkdp_echo_preview_url = 1
  vim.g.mkdp_highlight_css =
  os.getenv("HOME") .. "/dotfiles/dotfiles/.config/nvim/gruvbox-dark-medium.css"
end

function config.neorg()
  require('neorg').setup {
    load = {
      ["core.defaults"] = {},
      ["core.presenter"] = {
        config = {
          zen_mode = "zen-mode",
        }
      },
    },
  }
end

function config.vimwiki()
  local my_wiki = {
    ['path'] = '~/Dropbox/wiki/',
    ['syntax'] = 'markdown',
    ['ext'] = '.md',
    ['auto_toc'] = 1,
    ['nested_syntaxes'] = {
      ['python'] = 'python',
      ['c++'] = 'cpp',
      ['rust'] = 'rust',
      ['go'] = 'go',
    }
  }
  --[[ toc ]]
  vim.g.vimwiki_toc_header_level = 3
  vim.g.vimwiki_markdown_link_ext = 1
  -- vim.g.vimwiki_auto_chdir = 1
  vim.g.vimwiki_table_mappings = 0
  vim.g.vimwiki_table_auto_fmt = 0
  vim.g.vimwiki_list = { my_wiki }
  vim.g.vimwiki_ext2syntax = {
    ['.md'] = 'markdown',
    ['.markdown'] = 'markdown',
    ['.mdown'] = 'markdown'
  }
  vim.g.vimwiki_global_ext = 0
end

function config.venn()
  function _G.Toggle_venn()
    local venn_enabled = vim.inspect(vim.b.venn_enabled)
    if venn_enabled == "nil" then
      print("Venn Enabled")
      vim.b.venn_enabled = true
      vim.cmd[[setlocal ve=all]]
      vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", {noremap = true})
      vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", {noremap = true})
      vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", {noremap = true})
      vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", {noremap = true})
      vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", {noremap = true})
    else
      print("Venn Disable")
      vim.cmd[[setlocal ve=]]
      vim.cmd[[mapclear <buffer>]]
      vim.b.venn_enabled = nil
    end
  end
end

return config