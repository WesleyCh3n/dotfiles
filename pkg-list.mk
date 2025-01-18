
UNAME_S := $(shell uname -s)

FD_VER := 8.7.1
RG_VER := 14.0.3
FZF_VER := 0.57.0
EXA_VER := 0.10.1
LAZYGIT_VER := 0.44.1
NNN_VER := 4.9
BTOP_VER := 1.2.13
NVIM_VER := 0.10.3
DELTA_VER := 0.16.5
BAT_VER := 0.24.0
ZOXIDE_VER := 0.9.2
JUST_VER := 1.36.0

ifeq ($(UNAME_S),Darwin)
	LINK_FD := https://github.com/sharkdp/fd/releases/download/v$(FD_VER)/fd-v$(FD_VER)-x86_64-apple-darwin.tar.gz
	LINK_RG := https://github.com/BurntSushi/ripgrep/releases/download/$(RG_VER)/ripgrep-$(RG_VER)-x86_64-apple-darwin.tar.gz
	LINK_FZF := https://github.com/junegunn/fzf/releases/download/v$(FZF_VER)/fzf-$(FZF_VER)-darwin_amd64.tar.gz
	LINK_EXA := https://github.com/ogham/exa/releases/download/v$(EXA_VER)/exa-macos-x86_64-v$(EXA_VER).zip
	LINK_LAZYGIT := https://github.com/jesseduffield/lazygit/releases/download/v$(LAZYGIT_VER)/lazygit_$(LAZYGIT_VER)_Darwin_x86_64.tar.gz
	LINK_NNN := https://github.com/jarun/nnn/releases/download/v$(NNN_VER)/nnn-nerd-static-$(NNN_VER).x86_64.tar.gz
	LINK_BTOP := https://github.com/aristocratos/btop/releases/download/v$(BTOP_VER)/btop-x86_64-macos-monterey.tbz
	LINK_NVIM := https://github.com/neovim/neovim/releases/download/v$(NVIM_VER)/nvim-macos-x86_64.tar.gz
	LINK_DELTA := https://github.com/dandavison/delta/releases/download/$(DELTA_VER)/delta-$(DELTA_VER)-x86_64-apple-darwin.tar.gz
	LINK_BAT := https://github.com/sharkdp/bat/releases/download/v$(BAT_VER)/bat-v$(BAT_VER)-x86_64-apple-darwin.tar.gz
	LINK_ZOXIDE := https://github.com/ajeetdsouza/zoxide/releases/download/v$(ZOXIDE_VER)/zoxide-$(ZOXIDE_VER)-x86_64-apple-darwin.tar.gz
	LINK_JUST := https://github.com/casey/just/releases/download/$(JUST_VER)/just-$(JUST_VER)-x86_64-apple-darwin.tar.gz
	# LINK_GH := https://github.com/cli/cli/releases/download/v2.11.3/gh_2.11.3_macOS_amd64.tar.gz
else
	ifeq ($(shell arch),aarch64)
	LINK_FD := https://github.com/sharkdp/fd/releases/download/v8.4.0/fd-v8.4.0-aarch64-unknown-linux-gnu.tar.gz
	LINK_RG := https://github.com/microsoft/ripgrep-prebuilt/releases/download/v13.0.0-4/ripgrep-v13.0.0-4-aarch64-unknown-linux-gnu.tar.gz
	LINK_FZF := https://github.com/junegunn/fzf/releases/download/0.33.0/fzf-0.33.0-linux_arm64.tar.gz
	LINK_LAZYGIT := https://github.com/jesseduffield/lazygit/releases/download/v0.35/lazygit_0.35_Linux_arm64.tar.gz
	LINK_BTOP := https://github.com/aristocratos/btop/releases/download/v1.2.9/btop-aarch64-linux-musl.tbz
	LINK_DELTA := https://github.com/dandavison/delta/releases/download/0.14.0/delta-0.14.0-aarch64-unknown-linux-gnu.tar.gz
	LINK_BAT := https://github.com/sharkdp/bat/releases/download/v0.21.0/bat-v0.21.0-aarch64-unknown-linux-gnu.tar.gz
	LINK_ZOXIDE := https://github.com/ajeetdsouza/zoxide/releases/download/v0.8.3/zoxide-0.8.3-aarch64-unknown-linux-musl.tar.gz
	LINK_DPRINT := https://github.com/dprint/dprint/releases/download/0.31.1/dprint-aarch64-unknown-linux-gnu.zip
	else
	LINK_FD := https://github.com/sharkdp/fd/releases/download/v$(FD_VER)/fd-v$(FD_VER)-x86_64-unknown-linux-gnu.tar.gz
	LINK_RG := https://github.com/BurntSushi/ripgrep/releases/download/$(RG_VER)/ripgrep-$(RG_VER)-x86_64-unknown-linux-musl.tar.gz
	LINK_FZF := https://github.com/junegunn/fzf/releases/download/v$(FZF_VER)/fzf-$(FZF_VER)-linux_amd64.tar.gz
	LINK_EXA := https://github.com/ogham/exa/releases/download/v$(EXA_VER)/exa-linux-x86_64-v$(EXA_VER).zip
	LINK_LAZYGIT := https://github.com/jesseduffield/lazygit/releases/download/v$(LAZYGIT_VER)/lazygit_$(LAZYGIT_VER)_Linux_x86_64.tar.gz
	LINK_NNN := https://github.com/jarun/nnn/releases/download/v$(NNN_VER)/nnn-nerd-static-$(NNN_VER).x86_64.tar.gz
	LINK_NVIM := https://github.com/neovim/neovim/releases/download/v$(NVIM_VER)/nvim-linux64.tar.gz
	LINK_BTOP := https://github.com/aristocratos/btop/releases/download/v$(BTOP_VER)/btop-x86_64-linux-musl.tbz
	LINK_DELTA := https://github.com/dandavison/delta/releases/download/$(DELTA_VER)/delta-$(DELTA_VER)-x86_64-unknown-linux-musl.tar.gz
	LINK_BAT := https://github.com/sharkdp/bat/releases/download/v$(BAT_VER)/bat-v$(BAT_VER)-x86_64-unknown-linux-musl.tar.gz
	LINK_ZOXIDE := https://github.com/ajeetdsouza/zoxide/releases/download/v$(ZOXIDE_VER)/zoxide-$(ZOXIDE_VER)-x86_64-unknown-linux-musl.tar.gz
	LINK_JUST := https://github.com/casey/just/releases/download/$(JUST_VER)/just-$(JUST_VER)-x86_64-unknown-linux-musl.tar.gz
	# LINK_GH := https://github.com/cli/cli/releases/download/v2.11.3/gh_2.11.3_linux_amd64.tar.gz
	endif
endif

