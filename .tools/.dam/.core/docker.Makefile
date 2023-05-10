# Docker related targets
_docker_init: _docker_down_clear _docker_generate_stack _docker_pull _docker_build
	@${_NO_OP};

_docker_down:
	@${_ECHO} "\n${_C_WARNING} Stopping containers...${_C_STOP}\n";
	@-${_DC_STACK} down --remove-orphans
	@$(_ECHO_EXIT)

_docker_down_clear:
	@${_ECHO} "\n${_C_WARNING} Stopping containers...${_C_STOP}\n";
	@-${_DC_STACK} down -v --remove-orphans

_docker_pull:
	@${_ECHO} "\n${_C_INFO} Pulling images...${_C_STOP}\n";
	@${_DC_STACK} pull

_docker_build:
	@${_ECHO} "\n${_C_INFO} Building containers...${_C_STOP}\n";
	${_DC_STACK} build --build-arg COMPOSER_HOME=${COMPOSER_HOME}

_docker_build_no_cache:
	@${_ECHO} "\n${_C_INFO} Building containers...${_C_STOP}\n";
	@${_ECHO} "${_C_COMMENT} No cache...${_C_STOP}\n";
	@${_ECHO} "${_C_COMMENT} Pulling images...${_C_STOP}\n";
	@${_DC_STACK} build --pull --no-cache

_docker_up: _title
	@${_ECHO} "\n${_C_INFO} Starting containers...${_C_STOP}\n";
	@${_DC_STACK} up --detach
	@${_ECHO_OK}

_docker_up_attached: _title
	@${_ECHO} "\n${_C_INFO} Starting containers...${_C_STOP}\n";
	@${_DC_STACK} up

_docker_logs: c="${PROJECT_SHORT_TITLE} 📔 Logs"
_docker_logs: _title
	@-${_DC_STACK} logs --tail=0 --follow
	@${_ECHO} "\n${_C_WARNING} Logs exited...${_C_STOP}\n";

_docker_ps:
	@${_ECHO} "\n${_C_INFO} Containers...${_C_STOP}\n";
	@${_DC_STACK} ps
	@${_ECHO} "\n";

_docker_config:
	@${_ECHO} "\n${_C_INFO} Docker-compose config...${_C_STOP}\n";
	@${_DOCKER_COMP} ${_FILES} config

_docker_generate_stack:
	@${_ECHO} "\n${_C_INFO} Generating stack file...${_C_STOP}\n";
	@${_DOCKER_COMP} ${_FILES} config > ${_DC_STACK_FILE}
	@${_ECHO_OK}

##
## —— Docker 🐳 ————————————————————————————————————————————————————————————————
up: _docker_up time_current ## Start the docker hub in detached mode
	@${_NO_OP};

down: _docker_down time_current ## Stop the docker hub
	@${_NO_OP};

reload: _docker_down _docker_generate_stack _docker_up _docker_ps time_current ## Recreate stack file, restart the docker hub and show the current status
	@${_NO_OP};

restart: _docker_down _docker_up time_current ## Restart the docker hub
	@${_NO_OP};

ps: _docker_ps time_current ## List all running containers
	@${_NO_OP};

clear: _docker_down_clear cleanup time_current ## Stop the docker hub, remove volumes and cleanup the project
	@${_NO_OP};

cleanup: _do_project_cleanup ## Do project cleanup
	@${_NO_OP};

cfg: _docker_config time_current ## Display docker-compose config
	@${_NO_OP};

logs: _docker_logs ## Show live logs
	@${_NO_OP};

stack: _docker_config _docker_generate_stack time_current ## Show docker-compose config and Generate docker-compose stack file
	@${_NO_OP};

build: _docker_pull _docker_build time_current ## Build the docker images
	@${_NO_OP};
