#!/bin/bash

set -euo pipefail

sudo=""
test -x /usr/bin/sudo && sudo=/usr/bin/sudo

${sudo} apt update && \
  ${sudo} apt -y upgrade && \
  ${sudo} apt install -y bat curl git screen ssh vim