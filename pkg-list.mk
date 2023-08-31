
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
	LINK_FD := https://github.com/sharkdp/fd/releases/download/v8.3.0/fd-v8.3.0-x86_64-apple-darwin.tar.gz
	LINK_RG := https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep-13.0.0-x86_64-apple-darwin.tar.gz
	LINK_FZF := https://github.com/junegunn/fzf/releases/download/0.29.0/fzf-0.29.0-darwin_amd64.zip
	LINK_EXA := https://github.com/ogham/exa/releases/download/v0.10.1/exa-macos-x86_64-v0.10.1.zip
	LINK_LAZYGIT := https://github.com/jesseduffield/lazygit/releases/download/v0.35/lazygit_0.35_Darwin_x86_64.tar.gz
	LINK_MACCHINA := https://github.com/Macchina-CLI/macchina/releases/download/v6.0.1/macchina-macos-x86_64
	LINK_NNN := https://github.com/jarun/nnn/releases/download/v4.8/nnn-nerd-static-4.8.x86_64.tar.gz
	LINK_BTOP := https://github.com/aristocratos/btop/releases/download/v1.2.8/btop-x86_64-macos-monterey.tbz
	LINK_NVIM := https://github.com/neovim/neovim/releases/download/v0.9.1/nvim-macos.tar.gz
	LINK_LSD := https://github.com/Peltoche/lsd/releases/download/0.21.0/lsd-0.21.0-x86_64-apple-darwin.tar.gz
	LINK_DELTA := https://github.com/dandavison/delta/releases/download/0.12.1/delta-0.12.1-x86_64-apple-darwin.tar.gz
	LINK_BAT := https://github.com/sharkdp/bat/releases/download/v0.20.0/bat-v0.20.0-x86_64-apple-darwin.tar.gz
	LINK_GH := https://github.com/cli/cli/releases/download/v2.11.3/gh_2.11.3_macOS_amd64.tar.gz
	LINK_ZOXIDE := https://github.com/ajeetdsouza/zoxide/releases/download/v0.8.2/zoxide-0.8.2-x86_64-apple-darwin.tar.gz
	LINK_DPRINT := https://github.com/dprint/dprint/releases/download/0.30.3/dprint-x86_64-apple-darwin.tar.gz
else
	ifeq ($(shell arch),aarch64)
	LINK_FD := https://github.com/sharkdp/fd/releases/download/v8.4.0/fd-v8.4.0-aarch64-unknown-linux-gnu.tar.gz
	LINK_RG := https://github.com/microsoft/ripgrep-prebuilt/releases/download/v13.0.0-4/ripgrep-v13.0.0-4-aarch64-unknown-linux-gnu.tar.gz
	LINK_FZF := https://github.com/junegunn/fzf/releases/download/0.33.0/fzf-0.33.0-linux_arm64.tar.gz
	LINK_LAZYGIT := https://github.com/jesseduffield/lazygit/releases/download/v0.35/lazygit_0.35_Linux_arm64.tar.gz
	LINK_BTOP := https://github.com/aristocratos/btop/releases/download/v1.2.9/btop-aarch64-linux-musl.tbz
	LINK_LSD := https://github.com/Peltoche/lsd/releases/download/0.22.0/lsd-0.22.0-aarch64-unknown-linux-gnu.tar.gz
	LINK_DELTA := https://github.com/dandavison/delta/releases/download/0.14.0/delta-0.14.0-aarch64-unknown-linux-gnu.tar.gz
	LINK_BAT := https://github.com/sharkdp/bat/releases/download/v0.21.0/bat-v0.21.0-aarch64-unknown-linux-gnu.tar.gz
	LINK_ZOXIDE := https://github.com/ajeetdsouza/zoxide/releases/download/v0.8.3/zoxide-0.8.3-aarch64-unknown-linux-musl.tar.gz
	LINK_DPRINT := https://github.com/dprint/dprint/releases/download/0.31.1/dprint-aarch64-unknown-linux-gnu.zip
	else
	LINK_FD := https://github.com/sharkdp/fd/releases/download/v8.7.0/fd-v8.7.0-x86_64-unknown-linux-gnu.tar.gz
	LINK_RG := https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz
	LINK_FZF := https://github.com/junegunn/fzf/releases/download/0.42.0/fzf-0.42.0-linux_amd64.tar.gz
	LINK_EXA := https://github.com/ogham/exa/releases/download/v0.10.1/exa-linux-x86_64-v0.10.1.zip
	LINK_LAZYGIT := https://github.com/jesseduffield/lazygit/releases/download/v0.40.2/lazygit_0.40.2_Linux_x86_64.tar.gz
	# LINK_MACCHINA := https://github.com/Macchina-CLI/macchina/releases/download/v6.0.1/macchina-linux-x86_64
	LINK_NNN := https://github.com/jarun/nnn/releases/download/v4.9/nnn-nerd-static-4.9.x86_64.tar.gz
	LINK_NVIM := https://github.com/neovim/neovim/releases/download/v0.9.1/nvim-linux64.tar.gz
	LINK_BTOP := https://github.com/aristocratos/btop/releases/download/v1.2.13/btop-x86_64-linux-musl.tbz
	# LINK_LSD := https://github.com/Peltoche/lsd/releases/download/0.21.0/lsd-0.21.0-x86_64-unknown-linux-gnu.tar.gz
	LINK_DELTA := https://github.com/dandavison/delta/releases/download/0.16.5/delta-0.16.5-x86_64-unknown-linux-musl.tar.gz
	LINK_BAT := https://github.com/sharkdp/bat/releases/download/v0.23.0/bat-v0.23.0-x86_64-unknown-linux-musl.tar.gz
	# LINK_GH := https://github.com/cli/cli/releases/download/v2.11.3/gh_2.11.3_linux_amd64.tar.gz
	LINK_ZOXIDE := https://github.com/ajeetdsouza/zoxide/releases/download/v0.9.2/zoxide-0.9.2-x86_64-unknown-linux-musl.tar.gz
	# LINK_DPRINT := https://github.com/dprint/dprint/releases/download/0.30.3/dprint-x86_64-unknown-linux-gnu.zip
	endif
endif

