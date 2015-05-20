# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
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

alias l="ls --color=auto"
alias ls="ls --color=auto"
