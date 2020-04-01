#!/bin/sh

set -eo pipefail

export NVM_DIR="$HOME/.nvm"
source "/usr/local/opt/nvm/nvm.sh"
nvm install lts/*
exec npx semantic-release
