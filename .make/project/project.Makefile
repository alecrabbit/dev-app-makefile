cp: _cp_license _cp_readme
	@${_NO_OP};

_cp_license:
	@${_ECHO} "\n${_C_INFO} Copying license... ${_C_STOP}\n";
	@cp -f LICENSE ${_DAM_ROOT}/LICENSE

_cp_readme:
	@${_ECHO} "\n${_C_INFO} Copying readme... ${_C_STOP}\n";
	@cp -f README.md ${_DAM_ROOT}/README.md
