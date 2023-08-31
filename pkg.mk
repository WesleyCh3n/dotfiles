# basic setup
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
	PRINTF = printf
	SHELL := /bin/zsh
else
	PRINTF = env printf
	SHELL := /usr/bin/zsh
endif

# Control the build verbosity
ifeq ("$(VERBOSE)","1")
	Q :=
else
	Q := @
endif

PASS_COLOR = \e[32;01m
NO_COLOR = \e[0m

include pkg-list.mk

INSTALL_PATH := ${HOME}/.local/bin
MKDIR := $(shell mkdir -p $(INSTALL_PATH))
TMP_DIR := /tmp/dottmp/
MKDIR := $(shell mkdir -p $(TMP_DIR))

define dl
mkdir -p $(TMP_DIR); cd $(TMP_DIR); \
	curl -# -o tmp.tar -fL $(1); \
	tar xf tmp.tar;
endef


all: fd rg fzf lazygit nnn btop node nvim zoxide exa delta

.PHONY: clean zsh tpm fd rg fzf lazygit macchina lsd nnn btop node nvim
zsh:
	$(Q)chsh -s "$(shell which zsh)"
	$(Q)git clone https://github.com/tarjoilija/zgen.git ${HOME}/.zgen

tpm:
	$(Q)git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm
	$(Q)${HOME}/.tmux/plugins/tpm/scripts/install_plugins.sh

fd:
	$(Q)$(PRINTF) "$(PASS_COLOR)Installing $(@)$(NO_COLOR)\n"
	$(Q)$(call dl,$(LINK_FD))
	$(Q)mv $(TMP_DIR)/*/$(@) $(INSTALL_PATH)
	$(Q)rm -rf $(TMP_DIR)

rg:
	$(Q)$(PRINTF) "$(PASS_COLOR)Installing $(@)$(NO_COLOR)\n"
	$(Q)$(call dl,$(LINK_RG))
	$(Q)mv $(TMP_DIR)/*/$(@) $(INSTALL_PATH)
	$(Q)rm -rf $(TMP_DIR)

lazygit:
	$(Q)$(PRINTF) "$(PASS_COLOR)Installing $(@)$(NO_COLOR)\n"
	$(Q)$(call dl,$(LINK_LAZYGIT))
	$(Q)mv $(TMP_DIR)/$(@) $(INSTALL_PATH)
	$(Q)rm -rf $(TMP_DIR)

lsd:
	$(Q)$(PRINTF) "$(PASS_COLOR)Installing $(@)$(NO_COLOR)\n"
	$(Q)$(call dl,$(LINK_LSD))
	$(Q)mv $(TMP_DIR)/*/$(@) $(INSTALL_PATH)
	$(Q)rm -rf $(TMP_DIR)

exa:
	$(Q)$(PRINTF) "$(PASS_COLOR)Installing $(@)$(NO_COLOR)\n"
	$(Q)mkdir -p $(TMP_DIR); cd $(TMP_DIR); \
		curl '-#' -o tmp.zip -fL $(LINK_EXA); \
		unzip tmp.zip;
	$(Q)cp $(TMP_DIR)/bin/exa ~/.local/bin/
	$(Q)rm -rf $(TMP_DIR)

fzf:
	$(Q)$(PRINTF) "$(PASS_COLOR)Installing $(@)$(NO_COLOR)\n"
	$(Q)$(call dl,$(LINK_FZF))
	$(Q)mv $(TMP_DIR)/$(@) $(INSTALL_PATH)
	$(Q)rm -rf $(TMP_DIR)

btop:
	$(Q)$(PRINTF) "$(PASS_COLOR)Installing $(@)$(NO_COLOR)\n"
	$(Q)$(call dl,$(LINK_BTOP))
	cd $(TMP_DIR)/btop; make PREFIX=${HOME}/.local
	$(Q)rm -rf $(TMP_DIR)

nnn:
	$(Q)$(PRINTF) "$(PASS_COLOR)Installing $(@)$(NO_COLOR)\n"
	$(Q)if [ $(UNAME_S) = "Darwin" ]; then\
		mkdir -p $(TMP_DIR); cd $(TMP_DIR); \
		git clone https://github.com/jarun/nnn.git && cd nnn; \
		make O_NERD=1; \
		mv $(@) $(INSTALL_PATH); \
	else \
		mkdir -p $(TMP_DIR); cd $(TMP_DIR); \
		curl '-#' -o tmp.tar -fL $(LINK_NNN); \
		tar xf tmp.tar; \
		mv nnn-nerd-static $(INSTALL_PATH)/nnn; \
  fi
	$(Q)rm -rf $(TMP_DIR)

macchina:
	$(Q)$(PRINTF) "$(PASS_COLOR)Installing $(@)$(NO_COLOR)\n"
	$(Q)mkdir -p $(TMP_DIR); cd $(TMP_DIR); \
		curl '-#' -o $(@) -fL $(LINK_MACCHINA); \
		chmod +x $(@); \
		mv $(@) $(INSTALL_PATH)
	$(Q)rm -rf $(TMP_DIR)

nvim:
	$(Q)$(PRINTF) "$(PASS_COLOR)Installing $(@)$(NO_COLOR)\n"
	$(Q)$(call dl,$(LINK_NVIM))
	$(Q)cp -r $(TMP_DIR)/*/* ${HOME}/.local
	$(Q)rm -rf $(TMP_DIR)

node:
	$(Q)$(PRINTF) "$(PASS_COLOR)Installing $(@)$(NO_COLOR)\n"
	$(Q)curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
	$(Q)source ${HOME}/.zshrc && nvm install --lts

delta:
	$(Q)$(PRINTF) "$(PASS_COLOR)Installing $(@)$(NO_COLOR)\n"
	$(Q)$(call dl,$(LINK_DELTA))
	$(Q)mv $(TMP_DIR)/*/$(@) $(INSTALL_PATH)
	$(Q)rm -rf $(TMP_DIR)

bat:
	$(Q)$(PRINTF) "$(PASS_COLOR)Installing $(@)$(NO_COLOR)\n"
	$(Q)$(call dl,$(LINK_BAT))
	$(Q)mv $(TMP_DIR)/*/$(@) $(INSTALL_PATH)
	$(Q)rm -rf $(TMP_DIR)

gh:
	$(Q)$(PRINTF) "$(PASS_COLOR)Installing $(@)$(NO_COLOR)\n"
	$(Q)$(call dl,$(LINK_GH))
	$(Q)mv $(TMP_DIR)/*/bin/$(@) $(INSTALL_PATH)
	$(Q)rm -rf $(TMP_DIR)

zoxide:
	$(Q)$(PRINTF) "$(PASS_COLOR)Installing $(@)$(NO_COLOR)\n"
	$(Q)$(call dl,$(LINK_ZOXIDE))
	$(Q)mv $(TMP_DIR)/$(@) $(INSTALL_PATH)
	$(Q)rm -rf $(TMP_DIR)

dprint:
	$(Q)$(PRINTF) "$(PASS_COLOR)Installing $(@)$(NO_COLOR)\n"
ifeq ($(shell uname -s),Darwin)
	$(Q)$(call dl,$(LINK_DPRINT))
else
	$(Q)mkdir -p $(TMP_DIR); cd $(TMP_DIR); \
		curl '-#' -o tmp.zip -fL $(LINK_DPRINT); \
		unzip tmp.zip;
endif
	$(Q)mv $(TMP_DIR)/$(@) $(INSTALL_PATH)
	$(Q)rm -rf $(TMP_DIR)

clean:
	$(Q)rm -rf $(TMP_DIR)
