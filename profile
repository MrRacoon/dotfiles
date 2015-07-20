# Set up the keyboard track pad just the way I like it
synclient PalmDetect=1
synclient ClickFinger3=2

# Set up vi keybindings for the terminal
set -o vi

xcompmgr &

# Set the displays to display like correct displays
#  xrandr --output HDMI2 --auto
#  xrandr --output HDMI2 --left-of eDP1
# if [ `xrandr | grep -q '^DP1 connected'` ]; then
#     echo "Configuring external Screen"
#     xrandr --output DP1 --auto
#     xrandr --output DP1 --left-of eDP1
# fi
# if [ `xrandr | grep -q 'HDMI2 connected'` ]; then
#     echo "Configuring external Screen"
#     xrandr --output HDMI2 --auto
#     xrandr --output HDMI2 --left-of eDP1
# fi


# Set the chrome bin name for grunt testing
#  CHROME_BIN='chromium-browser'

# Aliases exist? Import that Mofo
[ -e "/home/$USER/.aliases" ] && source /home/$USER/.aliases

# fill in the background
#  feh --bg-fill ~/Pictures/red-leather-texture-background.jpg

export PATH="/home/erik/.cabal/bin:/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/usr/bin/core_perl:/home/erik/bin:/home/erik/.gem/ruby/2.1.0/bin:/home/erik/npm/bin"
