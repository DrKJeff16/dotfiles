! _cmd 'wine' && return

WINEPREFIX="$HOME/.wine"
if [[ $UID -ne 0 ]] && [[ "$USER" != "root" ]] && [[ "$HOME" != "/root" ]]; then
    WINEPREFIX="$HOME/.wine64"
fi
export WINEPREFIX
export WINEARCH="win64"
