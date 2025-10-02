[[ "$UID" == 0 ]] && return

if _cmd 'steam-runtime' && [[ -d "$HOME/.local/share/Steam" ]]; then
    export STEAM_DIR="$HOME/.local/share/Steam"
fi
