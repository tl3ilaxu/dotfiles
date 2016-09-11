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
#PATH=$PATH:~/.cabal/bin
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
stty -ixon #fixes ctrl-s
autoload colors
colors
setopt prompt_subst
PROMPT='%{$fg[green]%}%n@%m %{$fg_bold[yellow]%}${PWD/#$HOME/~}%{$reset_color%} %(?.✔.✗) '

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

alias screencast="vncviewer 192.168.0.191:0 -viewOnly"
alias remotescreen="vncviewer 192.168.0.191:0"
alias ls="ls --color=auto"
alias net="sudo netctl switch-to"
alias wall="feh --bg-scale -Z $HOME/Pictures/currentWallpaper.jpg"
alias vim="nvim"
alias packer="packer --noedit"
alias pavu7="PULSE_SERVER=zeven pavucontrol"

function cd {
    builtin cd "$@"
    echo ~+ > $HOME/.last_dir
}
source ~/.profile
#alias convert="libreoffice --headless --invisible --convert-to pdf 1-ER.pptxbreoffice --headless --invisible --convert-to pdf"
