#!/bin/bash -e

# shellcheck disable=SC2164
cd "$(dirname "$0")"

ansible-playbook \
    -v \
    --ask-become-pass \
    ansible/q3a.yaml
