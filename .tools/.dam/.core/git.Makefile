git_ignore_fix:
	git rm -r --cached .
	git add .
	git commit -m ".gitignore fix"
	@${_ECHO} "\n${_C_SELECT} ${PROJECT_NAME} ${_C_STOP} ${_C_INFO} .gitignore fix applied${_C_STOP}\n";

git_add_all:
	git add -A

git_stash_pop:
	git stash pop

git_stash:
	git stash

git_add_all_n_commit:
	git add -A
	git commit -m "$(or $(DEFAULT_COMMIT_MESSAGE),wip)"

git_push:
	git push

git_checkout:
	git checkout $(or $(WORKING_BRANCH),dev)

git_pull:
	git pull
