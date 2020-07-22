set +fp /home/efazati/.local/share/fonts
set fp rehash
rm -rf ~/tmp
mkdir ~/tmp

dbus-update-activation-environment DISPLAY XAUTHORITY
alias open="xdg-open"
export DESKTOP_SESSION=/usr/share/xsessions/i3
export XDG_CURRENT_DESKTO=XFCE
export XDG_SESSION_DESKTOP=XFCE
export XDG_VTNR=7
export XDG_SESSION_ID=c4
export XDG_MENU_PREFIX=xfce-
export XDG_SESSION_PATH=/org/freedesktop/DisplayManager/Session1
export XDG_SEAT_PATH=/org/freedesktop/DisplayManager/Seat0
export XDG_CONFIG_DIRS=/etc/xdg/xdg-xfce:/usr/share/upstart/xdg:/etc/xdg:/etc/xdg
export XDG_SEAT=seat0
export XDG_DATA_DIRS=/usr/share/xfce:/usr/local/share/:/usr/share/:/usr/share
export XDG_RUNTIME_DIR=/run/user/1000
export XDG_CURRENT_DESKTOP=XFCE
exec dbus-launch --exit-with-session i3

setxkbmap -option grp:switch,grp:alt_shift_toggle,grp_led:scroll,caps:none us,ir
xmodmap -e "keycode 66 = Linefeed"

#exec gnome-shell
i3
