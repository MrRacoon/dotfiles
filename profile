
if [ "$XDG_SESSION_DESKTOP" = "xmonad" ]; then
    # Use a fading compositor
    compton -f -i 0.8 -D 1 -b
    # xrandr --output DisplayPort-1 --rotate left
fi

#Configure the touchpad
# synclient ClickFinger3=2
# synclient TapButton1=0
# synclient TapButton2=0
# synclient PalmDetect=1
xrandr --output DP-1 --left-of HDMI-1
