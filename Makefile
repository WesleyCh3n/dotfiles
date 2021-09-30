MKDIR_CONFIG = $(subst dotfiles, ~, $(wildcard dotfiles/.config/*))
MKDIR_CONFIG += ~/.config/coc ~/.config/nnn ~/.config/configstore

all:
	@mkdir -p $(MKDIR_CONFIG)
	stow -t $(HOME) dotfiles
