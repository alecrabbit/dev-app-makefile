##
## —— DAM 🦫 ———————————————————————————————————————————————————————————————————
update: _update_message _update_dam ## Update DAM
	@${_ECHO};

_update_message:
	@${_ECHO} "\n${_C_COMMENT} Updating DAM...${_C_STOP}\n";

_update_dam:
	@$(eval c ?=)
	DEBUG=1 ./${_DN_ROOT}/${_DN_DAM}/${_DN_SH}/update.sh --debug --upgrade=$(c)

#_update_dam:
#	./${_DN_ROOT}/${_DN_DAM}/${_DN_SH}/moomba-dev --debug --upgrade
