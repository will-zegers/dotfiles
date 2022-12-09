#!/usr/bin/env bash

set -e

if [ $# -ne 1 ]; then
  echo "usage: $0 rc_file"
  exit 1
fi
RC_FILE=$1

sudo apt install -y build-essential pkg-config

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
echo 'PATH=${PATH}:${HOME}/.cargo/bin'
echo 'PATH=${PATH}:${HOME}/.cargo/bin' >> ${HOME}/${RC_FILE}
