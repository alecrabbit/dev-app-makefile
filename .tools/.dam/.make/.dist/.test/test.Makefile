##
## —— Testing 🧪  ——————————————————————————-————————————————————————————————————
_dist_test: _dt_message _dt_dist_test ## Run distribution test
	@${_ECHO};

_dt_message:
	@${_ECHO} "\n ${_C_COMMENT} DISTRIBUTION TEST... ${_C_STOP}\n";

_dt_dist_test: _dt_echo_variables _dt_color_check _dt_user _dt_include_dir
	@${_ECHO};
	@${_ECHO_DONE};

_dt_echo_variables:
	@${_ECHO} "\n${_C_COMMENT}Variables: ${_C_STOP}";
	@${_ECHO} "_DOCKER         = ${_DOCKER}";
	@${_ECHO} "_DOCKER_COMP    = ${_DOCKER_COMP}";
	@${_ECHO} "_DC_EXEC        = ${_DC_EXEC}";
	@${_ECHO} "_SYS_DIR        = ${_PWD_DIR}";
	@${_ECHO} "_DAM_ROOT       = ${_DAM_ROOT}";
	@${_ECHO} "_MAKE_ROOT      = ${_MAKE_ROOT}";
	@${_ECHO} "_BIN_DIR        = ${_BIN_DIR}";
	@${_ECHO} "_TIMED_DIR      = ${_TIMED_DIR}";
	@${_ECHO} "_DIST_DIR       = ${_DIST_DIR}";
	@${_ECHO} "_CORE_DIR       = ${_CORE_DIR}";
	@${_ECHO} "_APP_DIR        = ${_APP_DIR}";
	@${_ECHO} "_PROJECT_DIR    = ${_PROJECT_DIR}";
	@${_ECHO} "_DIST_CP_DIR    = ${_DIST_CP_DIR}";
	@${_ECHO} "_TEST_DIR       = ${_TEST_DIR}";
	@${_ECHO} "_INCLUDE_DIR    = ${_INCLUDE_DIR}";
	@${_ECHO} "_DEPRECATED_DIR = ${_DEPRECATED_DIR}";
	@${_ECHO} "_UNINSTALL_DIR  = ${_UNINSTALL_DIR}";
	@${_ECHO} "_INITS_DIR      = ${_INITS_DIR}";

	@${_ECHO} "_VAR_FILE       = ${_VAR_FILE}";

_dt_user:
	@${_ECHO} "\n${_C_COMMENT}User: ${_C_STOP}";
	@${_ECHO} "USER_ID    = ${USER_ID}"
	@${_ECHO} "GROUP_ID   = ${GROUP_ID}"
	@${_ECHO} "USER_NAME  = ${USER_NAME}"
	@${_ECHO} "GROUP_NAME = ${GROUP_NAME}"

_dt_include_dir:
	@${_ECHO} "\n${_C_COMMENT}Include directory: ${_C_STOP}";
	@${_ECHO} "Wildcard: $(_INCLUDE_DIR)/*.Makefile)";
	@${_ECHO} "$(wildcard $(_INCLUDE_DIR)/*.Makefile)";
