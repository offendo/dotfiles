export EDITOR=/usr/local/bin/emacsclient
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export QT_QPA_PLATFORMTHEME="qt5ct"
export GDK_SCALE=2
export QT_SCALE_FACTOR=2
export GDK_DPI_SCALE=1.0
export QT_AUTO_SCREEN_SCALE_FACTOR=1
# Disable the freaking beep
if [[ $XDG_SESSION_TYPE = "x11" ]]; then
    xset -b
elif [[ $TERM = "xterm-256color" ]]; then
    xset -b
else
    setterm -blength 0
fi
