if [[ "$UID" == 0 ]] || ! _cmd 'waybar' || ! [[ -d "$HOME/.config/waybar" ]]; then
    return
fi

export WAYBAR_CFG="$HOME/.config/waybar"
export WAYBARRC="$WAYBAR_CFG/config.jsonc"
