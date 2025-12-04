[[ "$UID" == 0 ]] && return
! _cmd 'waybar' && return

! [[ -d "$HOME/.config/waybar" ]] && return

export WAYBAR_CFG="$HOME/.config/waybar"
export WAYBARRC="$WAYBAR_CFG/config.jsonc"
