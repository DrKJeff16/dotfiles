if _cmd 'wine'; then
    if [[ $UID -ne 0 ]] && [[ "$USER" != "root" ]] && [[ "$HOME" != "/root" ]]; then
	    WINEPREFIX="$HOME/.wine64"
    else
	    WINEPREFIX="$HOME/.wine"
    fi
    export WINEPREFIX WINEARCH="win64"
fi
