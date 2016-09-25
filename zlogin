[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# Set editor
export EDITOR=nvim
# Graphical sudo authentication
export SUDO_ASKPASS="/usr/lib/ssh/ssh-askpass"
export PANEL_FIFO PANEL_HEIGHT PANEL_FONT_FAMILY
export PATH="$PATH:$HOME/.rvm/bin: /home/tleilaxu/.config/panel" # Add RVM to PATH for scripting
export PATH="$PATH:$HOME/bin" # Add RVM to PATH for scripting

#/usr/bin/pulseaudio-ctl &
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx
