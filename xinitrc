export OOO_FORCE_DESKTOP=gnome
export WINDOW_MANAGER=DWM
xmodmap ~/.xmodmap &
feh --bg-center ~/images/wallpaper/personal/perlogo.png

# gpg-agent starting (clean)
kill $(pgrep -u $UID gpg-agent)
eval $(gpg-agent --daemon --enable-ssh-support --write-env-file --default-cache-ttl 2100)

# Start the status bar
(sleep 1; ~/bin/conkystatus) &

# Start the news scroller if we are online
(
    sleep 4
    [ ! -f /tmp/sysonline ] && online
    source /tmp/sysonline
    [ $SYS_ONLINE = 1 ] && ~/bin/news_scroller
) &

# Starting useful programs
urxvt -e "screen -D -R" &

exec dwm

# vim:filetype=zsh:
