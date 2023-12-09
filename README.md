<h1 align="center">
  WesleyCh3n's dotfiles
</h1>

  <img src="https://user-images.githubusercontent.com/30611421/184923785-f1a4bac7-59e4-42de-a7aa-902f1ad815c2.png">

## 📖 Contents
- neovim config
- tmux config
- zsh config
- terminal config: wezterm, alacritty, iTerm2
- ...(some setup script)

## 💭 About

My personal dotfiles for Arch/MacOS/Ubuntu/Windows. If you see something useful feel free to use.

## One-line installation

```sh
curl -fsSL https://raw.githubusercontent.com/WesleyCh3n/dotfiles/main/install.sh | sh
```

## 🌟 Neovim Setup

Required Neovim >= 0.7

Nerd Font: [MesloLGS NF](https://github.com/romkatv/powerlevel10k-media)

#### 🖥  Better Coding
- [Packer.nvim](https://github.com/wbthomason/packer.nvim): A nvim plugin manager
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig): A configs of nvim builtin LSP
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter): Treesitter configuration
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp): A better completion for nvim

#### 🚀 Better Control
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim): A extendable fuzzy finder
- [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua): A neovim file explorer
- [leap.nvim](https://github.com/ggandor/leap.nvim): A easy motion plugin
- [nvim-surround](https://github.com/kylechui/nvim-surround): Manipulate parentheses
- [auto-pairs](https://github.com/jiangmiao/auto-pairs): Easily pair parentheses
- [Comment.nvim](https://github.com/numToStr/Comment.nvim): Easily comment code file
- [vim-easy-align](https://github.com/junegunn/vim-easy-align): Easily align code
- [targets.vim](https://github.com/wellle/targets.vim): More text object to operate on
- [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator): Easily move between tmux and nvim
- [vim-visual-multi](https://github.com/mg979/vim-visual-multi): A multi cursor plugin

#### ✨ Better UI
- [gruvbox-material](https://github.com/sainnhe/gruvbox-material): Best color scheme
- [galaxyline.nvim](https://github.com/glepnir/galaxyline.nvim): A highly customizable status line
- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim): Buffer on tab
- [which-key.nvim](https://github.com/folke/which-key.nvim): A popup UI show possible key bindings
- [registers.nvim](https://github.com/tversteeg/registers.nvim): A popup UI show registers and its value
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim): Better indent line
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim): A git decorations
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim): Highlight todo comments
- [vim-illuminate](https://github.com/RRethy/vim-illuminate): Highlight other occurrence of current word under cursor
- [TrueZen.nvim](https://github.com/Pocco81/TrueZen.nvim): A better distraction free mode

## 💻 Shell Setup
- [zsh shell](https://github.com/zsh-users/zsh)
- [zgen](https://github.com/tarjoilija/zgen): Plugin manager
- [powerlevel10k](https://github.com/romkatv/powerlevel10k): Shell theme
- [fzf](https://github.com/junegunn/fzf): A fuzzy finder
- [fzf-tab](https://github.com/Aloxaf/fzf-tab): Integrate fzf in shell tab and better UI
- [macchina](https://github.com/Macchina-CLI/macchina): A fast customizable system fetch

## 🧰 Modern Cli Tools

- [lazygit](https://github.com/jesseduffield/lazygit): A better git TUI for daily workflow
- [fd](https://github.com/sharkdp/fd): Faster and better find alternative
- [ripgrep](https://github.com/BurntSushi/ripgrep): Faster and better grep alternative
- [nnn](https://github.com/jarun/nnn): A fast file explorer TUI
- [btop](https://github.com/aristocratos/btop): A fast TUI system monitor
- [delta](https://github.com/dandavison/delta)
- [bat](https://github.com/sharkdp/bat)
- [gh](https://github.com/cli/cli)

## 📦 Installation (Use GNU `stow`)

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

🌟 Neovim ( 👻 Fully transparent background).

|                                                                                                                    |                                                                                                                     |
|                                                        :-:                                                         |                                                         :-:                                                         |
|                                                   🤖 Builtin LSP                                                   |                                                    🔭 Telescope                                                     |
|   ![LSP](https://user-images.githubusercontent.com/30611421/184917310-e2d147b2-02bd-49f4-bef8-269ac358eadd.png)    | ![Telescope](https://user-images.githubusercontent.com/30611421/184917843-9d0d255d-52ff-4759-a620-0eefae1584ac.png) |
|                                                💻 Builtin Terminal                                                 |                                                    🔍 Which key                                                     |
| ![Terminal](https://user-images.githubusercontent.com/30611421/184918606-bdccd4ca-0bfb-47b1-8682-36a0da7176a5.png) | ![which-key](https://user-images.githubusercontent.com/30611421/184918843-162fd963-ed96-4de6-b595-2054ad9d57fe.png) |
