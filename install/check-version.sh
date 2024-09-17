#!/bin/bash

if [ ! -f /etc/os-release ]; then
    echo "$(tput setaf 1)Error: Unable to determine OS. /etc/os-release file not found."
    echo "Installation stopped."
    exit 1
fi

. /etc/os-release

# Check if running on Ubuntu 24.04 or higher
if [ "$ID" != "ubuntu" ] || [ $(python3 -c "print(int(float('$VERSION_ID') >= 24.04))") != 1 ]; then
    echo "$(tput setaf 1)Error: OS requirement not met"
    echo "You are currently running: $ID $VERSION_ID"
    echo "OS required: ubuntu 24.04 or higher"
    echo "Installation stopped."
    exit 1
fi
