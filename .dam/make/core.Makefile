include ./.dam/make/.core/*
ifneq ("$(wildcard $(_INCLUDE_DIR)/*.Makefile)","")
  include $(wildcard $(_INCLUDE_DIR)/*.Makefile)
endif
include ${_PROJECT_DIR}/project.Makefile
include ./.dam/var.Makefile

## ——————————————————————————————— #️⃣  Makefile #️⃣  ——————————————————————————————
##
help: ## Outputs this help screen
	@grep -h -E '(^[a-zA-Z0-9_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}{printf "${_C_GREEN}%-30s${_C_STOP} %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'
	@${_ECHO} "";

%:  ## unknown target
	@${_ECHO} "${_C_ERROR}  ERROR  ${_C_STOP} Unknown target: ${_C_YELLOW}$@${_C_STOP}"
