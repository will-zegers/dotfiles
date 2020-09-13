#! /usr/bin/env bash

set -ex

function add-dotfile-as-source()
{
    local src=$1
    local dst=$2
    local cmd="source ${src}"

    grep "${cmd}" ${dst} &> /dev/null || echo ${cmd} >> ${dst}
}

rm -rf ${HOME}/{Documents,Music,Pictures,Public,Templates,Videos}

sudo apt -y update
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

sudo pip3 install \
  ipython \
;

# Use Python3
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 1

# ZSH tools and plugins
## Oh My Zsh
OH_MY_ZSH_DIR=${HOME}/.oh-my-zsh
if [ ! -d ${OH_MY_ZSH_DIR} ]
then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --unattended"
fi

## zsh-autosuggestions
ZSH_AUTOSUGGESTIONS_DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
if [ ! -d ${ZSH_AUTOSUGGESTIONS_DIR} ]
then
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_AUTOSUGGESTIONS_DIR}
fi

SCRIPT_PATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
add-dotfile-as-source ${SCRIPT_PATH}/bash/.bashrc ${HOME}/.bashrc
add-dotfile-as-source ${SCRIPT_PATH}/tmux/.tmux.conf ${HOME}/.tmux.conf
add-dotfile-as-source ${SCRIPT_PATH}/vim/.vimrc ${HOME}/.vimrc
add-dotfile-as-source ${SCRIPT_PATH}/zsh/.zshrc ${HOME}/.zshrc
add-dotfile-as-source ${SCRIPT_PATH}/zsh/.zshrc_aliases ${HOME}/.zshrc

chsh -s $(which zsh)
exec zsh
