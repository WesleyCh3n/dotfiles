MKDIR_CONFIG = $(subst dotfiles, ~, $(wildcard dotfiles/.config/*))
MKDIR_CONFIG += ~/.local/ ~/.config/nnn ~/.config/configstore

all:
	@mkdir -p $(MKDIR_CONFIG)
	stow -t $(HOME) dotfiles
