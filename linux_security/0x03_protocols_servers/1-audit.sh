#!/bin/bash

CONFIG="/etc/ssh/sshd_config"

if [ ! -f "$CONFIG" ]; then
    echo "Config file not found"
    exit 1
fi

# main config
grep -Ev '^\s*#|^\s*$' "$CONFIG"

# included configs
if grep -q "^Include" "$CONFIG"; then
    grep -Ev '^\s*#|^\s*$' /etc/ssh/sshd_config.d/*.conf 2>/dev/null
fi
