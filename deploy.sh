#! /usr/bin/env bash

set -e

rm -rf ${HOME}/{Documents,Music,Pictures,Public,Templates,Videos}

sudo apt -y update
sudo apt -y upgrade
sudo apt -y install \
  build-essential \
  curl \
  ddate \
  git \
  python3-venv \
  python3-pip \
  tmux \
  vim \
  xclip \
  zsh \
;
sudo apt -y autoremove

sudo pip3 install ipython

# Use Python3
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 1

# ZSH tools and plugins
## Oh My Zsh
OH_MY_ZSH_DIR=${HOME}/.oh-my-zsh
if [ ! -d ${OH_MY_ZSH_DIR} ]
then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  echo "alias gmod='git merge origin develop'" >> ~/.oh-my-zsh/plugins/git/git.plugin.zsh
fi

## zsh-autosuggestions
ZSH_AUTOSUGGESTIONS_DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
if [ ! -d ${ZSH_AUTOSUGGESTIONS_DIR} ]
then
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_AUTOSUGGESTIONS_DIR}
fi

cp vim/.vimrc ${HOME}
cp tmux/.tmux.conf ${HOME}
cp zsh/.zshrc ${HOME}
