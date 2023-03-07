#!/usr/bin/env sh

#######################
### NO DEPENDENCIES ###
#######################

_MAIN_BRANCH=${VERSION_MASTER:-"main"}
_DEV_BRANCH=${VERSION_DEVELOP:-"dev"}

__api_url="https://api.github.com/repos/"

github_get_latest_release() {
    __body="$(curl --silent "https://api.github.com/repos/${1}/releases/latest")"   # Get latest release from GitHub api
    echo "${__body}" | grep '"tag_name":' |                                         # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                                    # Pluck JSON value
}

github_get_tags() {
    __body="$(curl --silent "https://api.github.com/repos/${1}/tags")"              # Get tags from GitHub api
    echo "${__body}" | grep -m1 '"name":' |                                         # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                                    # Pluck JSON value
}

github_get_latest_version () {
    __latest="$(github_get_latest_release "${1}")"
    if [ "${__latest}" = "" ]; then
        __latest="$(github_get_tags "${1}")"
        if [ "${__latest}" = "" ]; then
            echo "No releases or tags found for repository '${1}'" >&2
            unset __latest
            return 1
        fi
    fi
    echo "${__latest}"
    unset __latest
    return 0
}

get_short_commit_id () {
    __repository="${1}"
    __version="${2:-${_MAIN_BRANCH}}"
    __commit_url="${__api_url}${__repository}/commits/tags/${__version}"
    if [ "${__version}" = "${_DEV_BRANCH}" ] || [ "${__version}" = "${_MAIN_BRANCH}" ] ; then
        __commit_url="${__api_url}${__repository}/commits/${__version}"
    fi
    __result="$(curl -s -H "Accept: application/vnd.github.v3+json" "${__commit_url}")"
    console_debug "${__commit_url}"
    console_debug "${__result}"
    short_commit_id=$(echo "${__result}" | grep -Po '(?<="sha": ")[a-f0-9]+' | head -n 1 | cut -c 1-8)
    echo "${short_commit_id}"
}
