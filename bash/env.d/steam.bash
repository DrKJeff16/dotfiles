if [[ "$UID" == 0 ]] || ! _cmd 'steam-runtime' || ! [[ -d "$HOME/.local/share/Steam" ]]; then
    return
fi

export STEAM_DIR="$HOME/.local/share/Steam"
