![cover](https://user-images.githubusercontent.com/30611421/146416165-179655b4-f198-411c-8dbf-99e9b7e561ad.jpg)

# WesleyCh3n's dotfiles

My personal dotfiles for MacOS/Ubuntu/Manjaro. If you see something useful feel free to use.

## 📖 Contents:
- neovim config
- tmux config
- zsh config
- terminal config: alacritty, iTerm2
- ...(some setup script)

## 🌟 Neovim setup

Required Neovim >= 0.6

Nerd Font: [MesloLGS NF](https://github.com/romkatv/powerlevel10k-media)

#### 🖥  Better Coding
- [Packer.nvim](https://github.com/wbthomason/packer.nvim): A nvim plugin manager
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig): A configs of nvim builtin LSP
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter): Treesitter configuration
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp): A better completion for nvim

#### 🚀 Better Control
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim): A extendable fuzzy finder
- [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua): A neovim file explorer
- [hop.nvim](https://github.com/phaazon/hop.nvim): A easy motion plugin
- [surround.vim](https://github.com/tpope/vim-surround): Manipulate parentheses
- [auto-pairs](https://github.com/jiangmiao/auto-pairs): Easily pair parentheses
- [nerdcommenter](https://github.com/preservim/nerdcommenter): Easily comment code file
- [vim-easy-align](https://github.com/junegunn/vim-easy-align): Easily align code
- [targets.vim](https://github.com/wellle/targets.vim): More text object to operate on
- [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator): Easily move between tmux and nvim
- [vim-visual-multi](https://github.com/mg979/vim-visual-multi): A multi cursor plugin
- [better-escape.nvim](https://github.com/max397574/better-escape.nvim): Lazy escape to normal mode

#### ✨ Better UI
- [gruvbox-material](https://github.com/sainnhe/gruvbox-material): Best color scheme
- [galaxyline.nvim](https://github.com/glepnir/galaxyline.nvim): A highly customizable status line
- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim): Buffer on tab
- [which-key.nvim](https://github.com/folke/which-key.nvim): A popup UI show possible key bindings
- [wilder.nvim](https://github.com/gelguy/wilder.nvim): A better UI and fzf builtin command
- [registers.nvim](https://github.com/tversteeg/registers.nvim): A popup UI show registers and its value
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim): Better indent line
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim): A git decorations
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim): Highlight todo comments
- [vim-illuminate](https://github.com/RRethy/vim-illuminate): Highlight other occurrence of current word under cursor
- [TrueZen.nvim](https://github.com/Pocco81/TrueZen.nvim): A better distraction free mode

## 💻 Shell setup
- [zsh shell](https://github.com/zsh-users/zsh)
- [zgen](https://github.com/tarjoilija/zgen): Plugin manager
- [powerlevel10k](https://github.com/romkatv/powerlevel10k): Shell theme
- [lazygit](https://github.com/jesseduffield/lazygit): A better git TUI for daily workflow
- [fd](https://github.com/sharkdp/fd): Faster and better find alternative
- [ripgrep](https://github.com/BurntSushi/ripgrep): Faster and better grep alternative
- [fzf](https://github.com/junegunn/fzf): A fuzzy finder
- [fzf-tab](https://github.com/Aloxaf/fzf-tab): Integrate fzf in shell tab and better UI
- [nnn](https://github.com/jarun/nnn): A fast file explorer TUI
- [btop](https://github.com/aristocratos/btop): A fast TUI system monitor
- [macchina](https://github.com/Macchina-CLI/macchina): A fast customizable system fetch

## 📦 Installation

1. `setup/install_essential.*.sh`: install basic requirements by your distro package manager.
2. `make`: use GNU `stow` to create soft-link to dotfiles.
3. `cd setup/manager/ && make`: install zsh/tmux pkg manager.
4. `cd setup/package/ && make`: install required packages.
    > 📄 Note: you can install specific package by `make <package>`
5. `cd setup/package/ && make nvim`: install nvim.
    > 📄 Note: after nvim installed, first open will look ugly because there is
    no plugin installed. Re-open nvim again and type `:PackerSync` and wait for
    all plugins to install.

Finished ~ 🎉🎉🎉

## 📸 Screenshot

<details>
  <summary>🌟 Neovim</summary>

🪄 Fully transparent background compatible
  - ✅ bubble theme
  - ✅ wild menu
  - ✅ which-key
  - ✅ floating window

|                                                                                                                            |
|                                                            :-:                                                             |
|                                                       🤖 Builtin LSP                                                       |
|       ![LSP](https://user-images.githubusercontent.com/30611421/146416175-22d7caf1-86e1-47d2-8d06-3ef3cb9bd8fd.jpg)        |
|                                                   🌳 NvimTree & Outline                                                    |
| ![NvimTree Outline](https://user-images.githubusercontent.com/30611421/146416181-b0ebf578-7e3c-4eea-8143-0930c693b774.jpg) |
|                                                        🔭 Telescope                                                        |
|    ![Telescope](https://user-images.githubusercontent.com/30611421/146416183-29983468-cfdb-498f-af42-4220ac0c7dee.jpg)     |
|                                                    💻 Builtin Terminal                                                     |
|     ![Terminal](https://user-images.githubusercontent.com/30611421/146416187-35d17023-22f8-4245-ad9e-8e40e25423e9.jpg)     |
|                                                ✅ Todo Highlight & UndoTree                                                |
|       ![todo](https://user-images.githubusercontent.com/30611421/146416190-6f2eed92-0e66-47b4-a71b-977a00a28b29.jpg)       |
|                                                        🔍 Which key                                                        |
|     ![undotree](https://user-images.githubusercontent.com/30611421/146416192-7e10157a-7e46-4f87-984c-db0f77975b11.jpg)     |
|                                                       🎫 Wilder menu                                                       |
|      ![Wilder](https://user-images.githubusercontent.com/30611421/146416195-b894c86a-2a77-4af0-91c1-81cf1f276def.jpg)      |
|                                                 ✨ Statusline/Lsp/Gitsigns                                                 |
|    ![statusline](https://user-images.githubusercontent.com/30611421/146418245-18225944-5701-4dbd-b2b4-05e9bbb6e335.jpg)    |

</details>
