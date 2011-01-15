export OOO_FORCE_DESKTOP=gnome
export WINDOW_MANAGER=DWM
xmodmap ~/.xmodmap &
feh --bg-center ~/images/wallpaper/personal/perlogo.png

# gpg-agent and syncing stuff

kill $(pgrep -u $UID gpg-agent)
eval $(gpg-agent --daemon --enable-ssh-support --write-env-file --default-cache-ttl 2100)

( rpass -l && sync ) &
(sleep 1; ~/bin/conkystatus) &
(
    sleep 4 
    [ ! -f /tmp/sysonline ] && online 
    source /tmp/sysonline
    [ $SYS_ONLINE = 1 ] && ~/bin/news_scroller
) &

urxvtd -f -q -o
exec dwm
# vim:filetype=zsh:
