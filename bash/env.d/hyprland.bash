if [[ "$UID" == 0 ]] || ! _cmd 'hyprland'; then
    return
fi

export HYPRSHOT_DIR="$HOME/Pictures/Screenshots"
export HYPR_CFG="$HOME/.config/hypr"
export HYPRLANDRC="$HYPR_CFG/hyprland.lua"
export HYPRLOCKRC="$HYPR_CFG/hyprlock.conf"
export HYPRIDLERC="$HYPR_CFG/hypridle.conf"
export HYPRXDPHRC="$HYPR_CFG/xdph.conf"
export HYPRGAMEMODE="$HYPR_CFG/gamemode.sh"
