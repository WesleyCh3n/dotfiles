include common.mk
include package.mk

INSTALL_PATH := ${HOME}/.local/bin
TMP_DIR := ./tmp

define dl
mkdir -p $(TMP_DIR); cd $(TMP_DIR); \
	curl -# -o tmp.tar -fL $(1); \
	tar xf tmp.tar;
endef


all: fd rg lazygit macchina logo-ls
	$(Q)rm -rf $(TMP_DIR)

.PHONY: fd rg lazygit macchina logo-ls nnn
fd:
	$(Q)$(PRINTF) "$(PASS_COLOR)Installing $(@)$(NO_COLOR)\n"
	$(Q)$(call dl,$(LINK_FD))
	$(Q)mv $(TMP_DIR)/*/$(@) $(INSTALL_PATH)

rg:
	$(Q)$(PRINTF) "$(PASS_COLOR)Installing $(@)$(NO_COLOR)\n"
	$(Q)$(call dl,$(LINK_RG))
	$(Q)mv $(TMP_DIR)/*/$(@) $(INSTALL_PATH)

lazygit:
	$(Q)$(PRINTF) "$(PASS_COLOR)Installing $(@)$(NO_COLOR)\n"
	$(Q)$(call dl,$(LINK_LAZYGIT))
	$(Q)mv $(TMP_DIR)/$(@) $(INSTALL_PATH)

logo-ls:
	$(Q)$(PRINTF) "$(PASS_COLOR)Installing $(@)$(NO_COLOR)\n"
	$(Q)$(call dl,$(LINK_LOGOLS))
	$(Q)mv $(TMP_DIR)/*/$(@) $(INSTALL_PATH)

fzf:
	$(Q)$(PRINTF) "$(PASS_COLOR)Installing $(@)$(NO_COLOR)\n"
	$(Q)$(call dl,$(LINK_FZF))
	$(Q)mv $(TMP_DIR)/$(@) $(INSTALL_PATH)

nnn:
	$(Q)$(PRINTF) "$(PASS_COLOR)Installing $(@)$(NO_COLOR)\n"
	$(Q)$(call dl,$(LINK_NNN))
	$(Q)mv $(TMP_DIR)/nnn-nerd-static $(INSTALL_PATH)/$(@)

macchina:
	$(Q)$(PRINTF) "$(PASS_COLOR)Installing $(@)$(NO_COLOR)\n"
	$(Q)mkdir -p $(TMP_DIR); cd $(TMP_DIR); \
		curl '-#' -o $(@) -fL $(LINK_MACCHINA); \
		chmod +x $(@); \
		mv $(@) $(INSTALL_PATH)

