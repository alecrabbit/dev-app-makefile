include ./.dam/make/.dist/*
include ./.dam/make/.core/*
include ./.dam/make/.dist/.test/*

## ——————————————————————————————— #️⃣  Makefile #️⃣  ——————————————————————————————
##
help: ## Outputs this help screen
	@grep -h -E '(^[a-zA-Z0-9_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}{printf "${_C_GREEN}%-30s${_C_STOP} %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

##
## —— Installation 🏗️  ——————————————————————————-———————————————————————————————
install: _install ## Perform installation procedure
uninstall: _uninstall_not_possible ## Run uninstall procedure

init: _init_not_possible ## Initialize project and start docker hub

%:  ## unknown target
	@${_ECHO} "${_C_ERROR}  ERROR  ${_C_STOP} Unknown target: ${_C_YELLOW}$@${_C_STOP}"