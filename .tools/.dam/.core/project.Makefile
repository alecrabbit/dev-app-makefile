_project_init: _project_init_message _do_project_init
	@${_NO_OP}

_project_init_message:
	@${_ECHO} "\n${_C_SELECT} ${PROJECT_NAME} ${_C_STOP} ${_C_INFO} Project initialization...${_C_STOP}\n";

_project_clear_flags: _project_clear_flags_message _do_project_clear_flags
	@${_NO_OP}

_project_clear_flags_message:
	@${_ECHO} "\n${_C_SELECT} ${PROJECT_NAME} ${_C_STOP} ${_C_INFO} Clearing flags...${_C_STOP}\n";

_project_set_flags: _project_set_flags_message _do_project_set_flags
	@${_NO_OP}

_project_set_flags_message:
	@${_ECHO} "\n${_C_SELECT}  ${PROJECT_NAME}  ${_C_STOP} ${_C_INFO} Setting flags...${_C_STOP}\n";

_project_install: _project_install_message _do_project_install
	@${_ECHO_DONE};

_project_install_message:
	@${_ECHO} "\n${_C_SELECT} ${PROJECT_NAME} ${_C_STOP} ${_C_INFO} Project installation...${_C_STOP}\n";

##
## —— Project 🚧 ———————————————————————————————————————————————————————————————
init: _initialize ## Initialize project and start docker hub
	@${_NO_OP}

chown: ## Change the owner(user) of the project
	sudo chown -R ${USER_ID}:${GROUP_ID} .

release: _release_message _do_release changelog ## Prepare for release
	@${_NO_OP}

_release_message:
	@${_ECHO} "\n${_C_SELECT} ${PROJECT_NAME} ${_C_STOP} ${_C_INFO}Preparing for release...${_C_STOP}\n";

_do_release:
	@${_BIN_DIR}/gitattributes.sh

changelog: _changelog_message _do_changelog ## Generate changelog
	@${_ECHO} "";

_changelog_message:
	@${_ECHO} "\n${_C_SELECT} ${PROJECT_NAME} ${_C_STOP} ${_C_INFO}Generating changelog...${_C_STOP}\n";

_do_changelog:
	@-git-chglog --output CHANGELOG.md
