#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Resolution
xrandr --newmode '1920x1080'  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
xrandr --addmode Virtual-1 1920x1080
xrandr --output Virtual-1 --mode 1920x1080 &

# Compositor
picom &

#Execute
cpu(){
    read -r cpu a b c previdle rest < /proc/stat
    prevtotal=$((a+b+c+previdle))
    sleep 0.5
    read -r cpu a b c idle rest < /proc/stat
    total=$((a+b+c+idle))
    cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
    echo ﬙ "$cpu"%
}

ram(){
    mem=$(free -h | awk '/Mem:/ { print $3 }' | cut -f1 -d 'i')
    echo  "$mem"
}

clock(){
    dte=$(date +"%D")
    time=$(date +"%H:%M")

    #echo " $dte  $time"
    echo  "$time"
}

while true; do
    xsetroot -name " $(cpu) | $(ram) | $(clock)"
    sleep 1s
done &

exec dwm
