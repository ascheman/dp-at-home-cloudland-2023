#!/bin/bash

set -euo pipefail

: "${SSH_CONFIG:=${PROJHOME}/etc/ssh/config}"

if test -n "${SSH_CONFIG:-''}" -a -r "${SSH_CONFIG}"; then
  echo "SSH config '${SSH_CONFIG}' already exists" >&2
  exit 1
fi

cat <<EOF > "${SSH_CONFIG}"
UserKnownHostsFile $PROJHOME/etc/ssh/known_hosts
HashKnownHosts no
StrictHostKeyChecking yes
EOF
