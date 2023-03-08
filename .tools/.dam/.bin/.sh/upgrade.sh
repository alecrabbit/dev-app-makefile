#!/usr/bin/env sh

EXECUTION_DIR="$( cd "$( dirname "$0" )" && pwd )"

ROOT_DIR="$( cd "$( dirname "$( dirname "$EXECUTION_DIR" )" )" && pwd )"

#echo "Root dir: '${ROOT_DIR}'"

export ROOT_DIR
export EXECUTION_DIR
. "$EXECUTION_DIR/helper_loader"

console_debug "Executing..."

read_options () {
    common_set_default_options
    console_debug "${SCRIPT_NAME}: Reading options"
    while [ "${1:-}" != "" ]; do
        __OPTION=$(echo "$1" | awk -F= '{print $1}')
        __VALUE=$(echo "$1" | awk -F= '{print $2}')
        case ${__OPTION} in
            --update-default)
                debug_option "${__OPTION}" "${__VALUE}"
                exit "${CR_TRUE}"
                ;;
            -r)
                debug_option "${__OPTION}" "${__VALUE}"
                core_check_option_value "${__VALUE}" "${__OPTION}"
                ROOT_DIR="${__VALUE}"
                ;;
            *)
                common_read_option "update_usage" "${__OPTION}$([ "${__VALUE}" != "" ] && echo "=${__VALUE}")"
                ;;
        esac
        shift
    done
    common_process_options
    common_export_options
    unset __OPTION __VALUE
}

update_usage () {
    echo "$(colored_green "Example"):"
    echo "    ${SCRIPT_NAME}"
}

read_options "$@"


