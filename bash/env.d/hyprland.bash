[[ "$UID" == 0 ]] && return

if _cmd 'Hyprland'; then
    export HYPRSHOT_DIR="$HOME/Pictures/Screenshots"
    export HYPR_CFG="$HOME/.config/hypr"
    export HYPRLANDRC="$HYPR_CFG/hyprland.conf"
    export HYPRLOCKRC="$HYPR_CFG/hyprlock.conf"
    export HYPRIDLERC="$HYPR_CFG/hypridle.conf"
    export HYPRXDPHRC="$HYPR_CFG/xdph.conf"
    export HYPRGAMEMODE="$HYPR_CFG/gamemode.sh"
fi
