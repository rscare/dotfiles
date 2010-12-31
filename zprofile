source ~/.zshrc
export PATH=/home/redscare/bin:/usr/local/bin:$PATH
export EDITOR=vim
export PROMPT="┌─── %B%*%b ─ %F{red}ᒥ|ᒣ%f
%{%}└┤ %B%F{red}%~%f%b "

if [ ! $(pgrep slim) ]; then
    echo -n "Start X? [Y/n] "
    read STARTX
    if [ ! "${STARTX[1]:l}" = "n" ]; then startx 2>&1 > /dev/null; fi
fi
