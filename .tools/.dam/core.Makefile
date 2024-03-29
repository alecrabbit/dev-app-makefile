# Core
.DEFAULT_GOAL = help
SHELL=/bin/bash

NOW=$(shell date +"%Y-%m-%dT%H%M%S")
_PWD_DIR=$(shell pwd)

# Core directory
_DN_CORE=.core
# Makefiles directory
_DN_MAKE=.make
# Shell scripts directory
_DN_SH=.sh

_ROOT_DIR=${_PWD_DIR}
_TOOLS_DIR=${_ROOT_DIR}/${_DN_TOOLS}
_DAM_ROOT=${_TOOLS_DIR}/${_DN_DAM}
_BIN_DIR=${_DAM_ROOT}/${_DN_BIN}
_MAKE_ROOT=${_ROOT_DIR}/${_DN_MAKE}
_CORE_DIR=${_DAM_ROOT}/${_DN_CORE}
_SH_DIR=${_BIN_DIR}/${_DN_SH}

# Include core
include $(wildcard $(_CORE_DIR)/*.Makefile)

# Include cp.Makefile if present
ifneq ("$(wildcard $(_CP_FILE))","")
  include $(_CP_FILE)
endif

# Include includes if any
ifneq ("$(wildcard $(_INCLUDE_DIR)/*.Makefile)","")
  include $(wildcard $(_INCLUDE_DIR)/*.Makefile)
endif

# Include project if any
ifneq ("$(wildcard $(_PROJECT_DIR)/project.Makefile)","")
  include $(_PROJECT_DIR)/project.Makefile
endif

# Include var if any
ifneq ("$(wildcard $(_VAR_FILE))","")
  include $(_VAR_FILE)
endif

# Include tests if any and if enabled
ifeq ($(GLOBAL_DEBUG), 1)
	ifneq ("$(wildcard $(_TEST_DIR)/*.Makefile)","")
		include $(wildcard $(_TEST_DIR)/*.Makefile)
	endif
endif

## ——————————————————————————————— #️⃣  Makefile #️⃣  ——————————————————————————————
help: ## Outputs this help screen
	@grep -h -E '(^[a-zA-Z0-9_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}{printf "${_C_GREEN}%-30s${_C_STOP} %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'
	@${_ECHO} "";

%:  ## unknown target
	@${_ECHO} "\n${_C_ERROR}  ERROR  ${_C_STOP} Unknown target: ${_C_YELLOW}$@${_C_STOP}\n"
