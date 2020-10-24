#! /usr/bin/env bash

set -ex

SCRIPT_PATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

function add-dotfile-as-source()
{
    local src=$1
    local dst=$2
    local cmd="source ${src}"

    grep "${cmd}" ${dst} &> /dev/null || echo ${cmd} >> ${dst}
}

rm -rf ${HOME}/{Documents,Music,Pictures,Public,Templates,Videos}

# ZSH tools and plugins
## Oh My Zsh
OH_MY_ZSH_DIR=${HOME}/.oh-my-zsh
if [ ! -d ${OH_MY_ZSH_DIR} ]
then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --unattended"
  cp ${SCRIPT_PATH}/zsh/themes/* ${OH_MY_ZSH_DIR}/themes/
fi

## zsh-autosuggestions
ZSH_AUTOSUGGESTIONS_DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
if [ ! -d ${ZSH_AUTOSUGGESTIONS_DIR} ]
then
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_AUTOSUGGESTIONS_DIR}
fi

add-dotfile-as-source ${SCRIPT_PATH}/bash/.bashrc ${HOME}/.bashrc
add-dotfile-as-source ${SCRIPT_PATH}/tmux/.tmux.conf ${HOME}/.tmux.conf
add-dotfile-as-source ${SCRIPT_PATH}/vim/.vimrc ${HOME}/.vimrc
add-dotfile-as-source ${SCRIPT_PATH}/zsh/.zshrc ${HOME}/.zshrc
add-dotfile-as-source ${SCRIPT_PATH}/aliases ${HOME}/.zshrc

PLUGIN_START_DIR=${HOME}/.vim/pack/vendor/start
mkdir -p ${PLUGIN_START_DIR}
git clone https://github.com/preservim/nerdtree.git ${PLUGIN_START_DIR}/nerdtree

mkdir ${HOME}/.vim/plugin
git clone https://github.com/jiangmiao/auto-pairs.git /tmp/auto-pairs
cp /tmp/auto-pairs/plugin/auto-pairs.vim ${HOME}/.vim/plugin
