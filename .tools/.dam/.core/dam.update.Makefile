##
## —— DAM 🦫 ———————————————————————————————————————————————————————————————————
dam_update: _do_dam_update_message _do_dam_update ## Update DAM
	@${_ECHO};

_do_dam_update_message:
	@${_ECHO} "\n${_C_COMMENT} Updating DAM...${_C_STOP}\n";

_do_dam_update:
	@$(eval c ?=)
	@DEBUG=1 ${_SH_DIR}/update.sh --debug --upgrade=$(c) && ./install
