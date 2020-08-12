#!/bin/bash
# Based on https://gist.github.com/pcworld/3198763
# Mute spotify when it starts advertisement
# Run like this
# nohup bash ~/bin/spotify/mute.sh  > /tmp/spotify_mute.log & 
#rm -rf /tmp/spotify_mute.log
#pkill -f "mute.sh"  
# Settings

# VAR
ADMUTE=0
PAUSED=0

# FCT

get_pactl_nr(){
    pactl list | grep -E '(^Sink Input)|(media.name = \"Spotify\"$)' | cut -d \# -f2 \
    | grep -v Spotify
}

# Find window id
WM_ID=$(xdotool search --class "spotify" | sed -n 2p)

# MAIN

xprop -spy -id "$WM_ID" WM_NAME |
while read -r XPROPOUTPUT; do
    XPROP_TRACKDATA="$(echo "$XPROPOUTPUT" | cut -d \" -f 2 )"
    DBUS_TRACKDATA="$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 \
    org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' | grep xesam:title -A 1 | grep variant | cut -d \" -f 2)"

    echo "XPROP:    $XPROP_TRACKDATA"
    echo "DBUS:     $DBUS_TRACKDATA"

    if [[ "$DBUS_TRACKDATA" =~ ^(Advertisement|Spotify)$ ]]
      then
          echo "--PAUSED--"
          PAUSED="1"
      else
          PAUSED=0
          echo "--NOTPAUSED--"
    fi


    if [[ "$PAUSED" = 0 ]]
      then
          # || "$XPROP_TRACKDATA" =~ "$DBUS_TRACKDATA" ]]
          echo "--NO ADS--"
          echo "ADMUTE: $ADMUTE"
          echo "PAUSED: $PAUSED" 		
          if [[ "$ADMUTE" = "1" ]]
            then
                sleep 0.5
                num=$(pactl list | grep -E '(^Sink Input)|(media.name = \"Spotify\"$)' | awk '/Spotify/ {print a} {a = $0}' | cut -c 13-)
                pactl set-sink-input-mute $num no
                echo "UnMuting"
          fi
          ADMUTE=0
      else
          echo "--ADS--"
          echo "ADMUTE: $ADMUTE"
          echo "PAUSED: $PAUSED"            
          if [[ "$ADMUTE" != "1" ]]
            then
              num=$(pactl list | grep -E '(^Sink Input)|(media.name = \"Spotify\"$)' | awk '/Spotify/ {print a} {a = $0}' | cut -c 13-)
              pactl set-sink-input-mute $num yes
              echo "Muting"
          fi
          ADMUTE="1"
    fi
done

echo "Spotify not active. Exiting."
exit 0

