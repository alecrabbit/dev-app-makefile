##
## —— DAM 🦫 ———————————————————————————————————————————————————————————————————
upgrade: _do_dam_upgrade_message _do_dam_upgrade ## Upgrade DAM
	@${_NO_OP}

_do_dam_upgrade_message:
	@${_ECHO} "\n${_C_COMMENT} Updating DAM...${_C_STOP}\n";

_do_dam_upgrade:
	@$(eval c ?=)
	@-DEBUG=${GLOBAL_DEBUG:-0} ${_SH_DIR}/upgrade.sh --upgrade=$(c) && ./install
