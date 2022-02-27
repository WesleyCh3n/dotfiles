include common.mk
include package.mk

INSTALL_PATH := ${HOME}/.local/bin
TMP_DIR := ./tmp

define dl
mkdir -p $(TMP_DIR); cd $(TMP_DIR); \
	curl -# -o tmp.tar -fL $(1); \
	tar xf tmp.tar;
endef


all: fd rg fzf lazygit macchina logo-ls nnn btop

.PHONY: clean fd rg fzf lazygit macchina logo-ls nnn btop
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

logo-ls:
	$(Q)$(PRINTF) "$(PASS_COLOR)Installing $(@)$(NO_COLOR)\n"
	$(Q)$(call dl,$(LINK_LOGOLS))
	$(Q)mv $(TMP_DIR)/*/$(@) $(INSTALL_PATH)
	$(Q)rm -rf $(TMP_DIR)

fzf:
	$(Q)$(PRINTF) "$(PASS_COLOR)Installing $(@)$(NO_COLOR)\n"
	$(Q)$(call dl,$(LINK_FZF))
	$(Q)mv $(TMP_DIR)/$(@) $(INSTALL_PATH)
	$(Q)rm -rf $(TMP_DIR)

btop:
	$(Q)$(PRINTF) "$(PASS_COLOR)Installing $(@)$(NO_COLOR)\n"
	$(Q)$(call dl,$(LINK_BTOP))
	cd $(TMP_DIR); make PREFIX=${HOME}/.local
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
		mv nnn-nerd-static $(INSTALL_PATH); \
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

clean:
	$(Q)rm -rf $(TMP_DIR)
