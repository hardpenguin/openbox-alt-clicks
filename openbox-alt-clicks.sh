#!/bin/bash

CDPATH=
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "${script_dir}"

config_path="${HOME}/.config/openbox/lxde-rc.xml"
enabled_path="${script_dir}/enabled.xml"
disabled_path="${script_dir}/disabled.xml"

enable() {
    cp "${enabled_path}" "${config_path}"
    sleep 1s
    openbox --restart
}

disable() {
    cp "${disabled_path}" "${config_path}"
    sleep 1s
    openbox --restart
}

case "${1}" in
    "-e")           enable ;;
    "--enable")     enable ;;
    "-d")           disable ;;
    "--disable")    disable ;;
    *)              echo "$(basename ${0}): Wrong option: use --enable or --disable"
esac