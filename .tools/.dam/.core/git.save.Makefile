save: save_branch_echo git_add_all git_stash git_checkout git_pull git_stash_pop git_add_all_n_commit ## Save to local
	@${_ECHO} "\n${_C_SELECT} ${PROJECT_NAME} ${_C_STOP} ${_C_INFO} Saved to branch: '$(or ${WORKING_BRANCH},dev)' with message '$(or ${COMMIT_MESSAGE},)' ${_C_STOP}\n";

save_push: save git_push ## Save and push to remote
	@${_NO_OP};

save_branch_echo:
	@${_ECHO} "Saving to branch: '$(or ${WORKING_BRANCH},dev)'"
