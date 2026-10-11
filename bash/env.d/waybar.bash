if [[ "$UID" == 0 ]] || ! _cmd 'waybar'; then
    return
fi

export WAYBAR_CFG="$HOME/.config/waybar"
export WAYBARRC="$WAYBAR_CFG/config.jsonc"
! [[ -d "$WAYBAR_CFG" ]] && mkdir -p "$WAYBAR_CFG"
