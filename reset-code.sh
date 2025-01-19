#!/usr/bin/env bash

echo "***************************************************"
echo "Reset user's VS Code settings and other state"
echo "***************************************************"

set -uo pipefail

if [[ -z ${WSL_DISTRO_NAME-} ]]; then
    # Remove existing user config (if any) and customize settings to non-default values
    SETTINGS_DIR=${HOME}/.config/Code/User

    [ -d "$SETTINGS_DIR" ] && rm -rf "$SETTINGS_DIR"
    mkdir -p $SETTINGS_DIR
    cp ./vscode-settings.json $SETTINGS_DIR/settings.json
else
    echo
    echo "WSL detected, skipping user VS code settings reset";
fi

