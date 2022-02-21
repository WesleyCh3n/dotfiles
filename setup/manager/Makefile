all: zsh tpm

.PHONY: zsh tpm
zsh:
	$(Q)chsh -s "$(shell which zsh)"
	$(Q)git clone https://github.com/tarjoilija/zgen.git ${HOME}/.zgen

tpm:
	$(Q)git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm
	$(Q)${HOME}/.tmux/plugins/tpm/scripts/install_plugins.sh
