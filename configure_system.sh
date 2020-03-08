#! /usr/bin/env bash

set -e

CONFIG_WITNESS=${HOME}/.config/config_witness

if [ -f ${CONFIG_WITNESS} ]
then
  exit 0
fi

CONFIG_FILES=${HOME}/{${HOME}/.config/terminator/config,${HOME}/.vimrc,${HOME}/.zshrc}
sudo -v

rm -rf ${HOME}/{Documents,Music,Pictures,Public,Templates,Videos}

sudo apt -y update
sudo apt -y upgrade
sudo apt -y install \
  build-essential \
  cmatrix \
  curl \
  ddate \
  git \
  ipython \
  neofetch \
  python3-venv \
  python3-pip \
  terminator \
  tmux \
  vim \
  zsh \
;
sudo apt -y autoremove

sudo pip3 install ipython

# ZSH tools and plugins
## Oh My Zsh
DIR=${HOME}/.oh-my-zsh
if [ ! -d ${DIR} ]
then
  echo ${DIR}
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

## zsh-autosuggestion
DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
if [ ! -d ${DIR} ]
then
  git clone https://github.com/zsh-users/zsh-autosuggestions ${DIR}
fi

# SSH setup
KEY_TYPE=ed25519
if [ ! -f ${HOME}/.ssh/id_${KEY_TYPE}.pub ]
then
  ssh-keygen -t ${KEY_TYPE}
fi

# Use Python3
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 1

cp ./config.terminator ${HOME}/.config/terminator/config
cp ./{.vimrc,.zshrc} ${HOME}

touch ${CONFIG_WITNESS}
