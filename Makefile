MKDIR_CONFIG = $(subst dotfiles, ~, $(wildcard dotfiles/.config/*))
MKDIR_CONFIG += ~/.local/bin/ ~/.config/nnn ~/.config/configstore

all:
	@mkdir -p $(MKDIR_CONFIG)
	stow -t $(HOME) dotfiles

pkg:
	make -f ./pkg.mk

mgr-zsh:
	make -f ./pkg.mk zsh

mgr-tpm:
	make -f ./pkg.mk tpm
