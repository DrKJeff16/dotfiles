[[ "$UID" == 0 ]] && return

if _cmd 'waybar' && [[ -d "$HOME/.config/waybar" ]]; then
    export WAYBAR_CFG="$HOME/.config/waybar"
    export WAYBARRC="$WAYBAR_CFG/config.jsonc"
fi
