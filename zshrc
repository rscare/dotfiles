alias ls='ls --color=auto'
alias rm='rm -I'
alias bell="echo -e '\a'"
alias beep="echo -e '\a'"
alias :e='vim'
alias :q='exit'
alias startx='exec startx'
alias pandora='mkfifo ~/.config/pianobar/ctl; pianobar; rm ~/.config/pianobar/ctl'

# Allow personal program to run
disable suspend

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]} r:|[._-]=* r:|=*' 'm:{[:lower:]}={[:upper:]} r:|[._-]=* r:|=*' 'm:{[:lower:]}={[:upper:]} r:|[._-]=* r:|=*' 'm:{[:lower:]}={[:upper:]} r:|[._-]=* r:|=*'
zstyle :compinstall filename '/home/redscare/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.zhistfile
HISTSIZE=77
SAVEHIST=77
bindkey -e
# End of lines configured by zsh-newuser-install
