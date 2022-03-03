
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
	LINK_FD := https://github.com/sharkdp/fd/releases/download/v8.3.0/fd-v8.3.0-x86_64-apple-darwin.tar.gz
	LINK_RG := https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep-13.0.0-x86_64-apple-darwin.tar.gz
	LINK_FZF := https://github.com/junegunn/fzf/releases/download/0.29.0/fzf-0.29.0-darwin_amd64.zip
	LINK_LAZYGIT := https://github.com/jesseduffield/lazygit/releases/download/v0.31.4/lazygit_0.31.4_Darwin_x86_64.tar.gz
	LINK_MACCHINA := https://github.com/Macchina-CLI/macchina/releases/download/v6.0.1/macchina-macos-x86_64
	LINK_NNN := https://github.com/jarun/nnn/releases/download/v4.4/nnn-nerd-static-4.4.x86_64.tar.gz
	LINK_BTOP := https://github.com/aristocratos/btop/releases/download/v1.2.3/btop-x86_64-macos-monterey.tbz
	LINK_NVIM := https://github.com/neovim/neovim/releases/download/v0.6.0/nvim-macos.tar.gz
	LINK_LSD := https://github.com/Peltoche/lsd/releases/download/0.21.0/lsd-0.21.0-x86_64-apple-darwin.tar.gz
else
	LINK_FD := https://github.com/sharkdp/fd/releases/download/v8.3.0/fd-v8.3.0-x86_64-unknown-linux-gnu.tar.gz
	LINK_RG := https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz
	LINK_FZF := https://github.com/junegunn/fzf/releases/download/0.29.0/fzf-0.29.0-linux_amd64.tar.gz
	LINK_LAZYGIT := https://github.com/jesseduffield/lazygit/releases/download/v0.31.4/lazygit_0.31.4_Linux_x86_64.tar.gz
	LINK_MACCHINA := https://github.com/Macchina-CLI/macchina/releases/download/v6.0.1/macchina-linux-x86_64
	LINK_NNN := https://github.com/jarun/nnn/releases/download/v4.4/nnn-nerd-static-4.4.x86_64.tar.gz
	LINK_BTOP := https://github.com/aristocratos/btop/releases/download/v1.2.3/btop-x86_64-linux-musl.tbz
	LINK_NVIM := https://github.com/neovim/neovim/releases/download/v0.6.0/nvim-linux64.tar.gz
	LINK_LSD := https://github.com/Peltoche/lsd/releases/download/0.21.0/lsd-0.21.0-x86_64-unknown-linux-gnu.tar.gz
endif

