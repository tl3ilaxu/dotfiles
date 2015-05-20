zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _ignored _correct
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle :compinstall filename '$HOME/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
PATH=$PATH:~/.cabal/bin

stty -ixon #fixes ctrl-s
autoload colors
colors
setopt prompt_subst
PROMPT='[%T]%{$fg[blue]%} %n@%m %{$fg_bold[yellow]%}${PWD/#$HOME/~}%{$reset_color%} %(?.✔.✗) '
export EDITOR=vim

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
alias upAll="sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade && sudo apt-get autoremove"
alias l="ls --color=auto"
alias clip="xclip -selection c"
alias python="python3.4"
alias ls="ls --color=auto"
