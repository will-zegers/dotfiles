export PATH=$PATH:${HOME}/.vim/pack/bundle/start/fzf/bin
export PATH=$PATH:${HOME}/.local/bin

export EDITOR=$(which nvim)
export VISUAL=$(which nvim)

ZSH_THEME="rkj-repos"

# Case-sensitive completion.
CASE_SENSITIVE="true"

plugins=(git vi-mode zsh-autosuggestions sudo zsh-syntax-highlighting fzf tmux)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

# Add fzf bin directory to the PATH
export FZF_DEFAULT_COMMAND='rg --files'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /home/will/dotfiles/aliases
