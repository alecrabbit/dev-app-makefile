#!/usr/bin/env sh

EXECUTION_DIR="$( cd "$( dirname "$0" )" && pwd )"
. "$EXECUTION_DIR/helper_loader"

console_debug "Executing..."

mmb_read_options () {
    common_set_default_options
    mmb_set_default_options
    console_debug "MMB: Reading options"
    while [ "${1:-}" != "" ]; do
        __OPTION=$(echo "$1" | awk -F= '{print $1}')
        __VALUE=$(echo "$1" | awk -F= '{print $2}')
        case ${__OPTION} in
            --update-default)
                debug_option "${__OPTION}" "${__VALUE}"
                mmb_update_default_template
                exit "${CR_TRUE}"
                ;;
            -p)
                debug_option "${__OPTION}" "${__VALUE}"
                core_check_option_value "${__VALUE}" "${__OPTION}"
                TMPL_PACKAGE_NAME="${__VALUE}"
                ;;
            -o)
                debug_option "${__OPTION}" "${__VALUE}"
                core_check_option_value "${__VALUE}" "${__OPTION}"
                TMPL_PACKAGE_OWNER="${__VALUE}"
                ;;
            -n)
                debug_option "${__OPTION}" "${__VALUE}"
                core_check_option_value "${__VALUE}" "${__OPTION}"
                TMPL_PACKAGE_OWNER_NAME="${__VALUE}"
                ;;
            --namespace)
                debug_option "${__OPTION}" "${__VALUE}"
                core_check_option_value "${__VALUE}" "${__OPTION}"
                TMPL_PACKAGE_NAMESPACE="${__VALUE}"
                TMPL_USE_NAMESPACE_OVERRIDE="${CR_TRUE}"
                ;;
            --no-git)
                debug_option "${__OPTION}" "${__VALUE}"
                TMPL_CREATE_GIT_REPO="${CR_FALSE}"
                ;;
            -s)
                debug_option "${__OPTION}" "${__VALUE}"
                core_check_option_value "${__VALUE}" "${__OPTION}"
                TMPL_PACKAGE_OWNER_NAMESPACE="${__VALUE}"
                ;;
            -x)
                debug_option "${__OPTION}" "${__VALUE}"
                TMPL_USE_OWNER_NAMESPACE="${CR_FALSE}"
                ;;
            -t)
                debug_option "${__OPTION}" "${__VALUE}"
                console_info "Template to use as default: '${TMPL_WORKING_TEMPLATE_NAME}'"
                core_check_option_value "${__VALUE}" "${__OPTION}"
                _TEMPLATE_OPTION_USED="${CR_TRUE}"
                TMPL_WORKING_TEMPLATE_NAME="${__VALUE}"
                ;;
            *)
                common_read_option "mmb_usage" "${__OPTION}$([ "${__VALUE}" != "" ] && echo "=${__VALUE}")"
                ;;
        esac
        shift
    done
    common_process_options
    common_export_options
    mmb_process_options
    mmb_export_options
    unset __OPTION __VALUE
}