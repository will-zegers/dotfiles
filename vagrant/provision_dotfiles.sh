#!/usr/bin/env bash

set -e

DOTFILES=${HOME}/dotfiles

sudo apt update
sudo apt install -y git
git clone https://github.com/will-zegers/dotfiles.git ${DOTFILES}
sudo ${DOTFILES}/install_dependencies
${DOTFILES}/deploy

echo "SHELL=`which zsh`" >> ${HOME}/.bash_profile
echo '[ -z "$ZSH_VERSION"   ] && exec /bin/zsh -l' >> ${HOME}/.bash_profile
