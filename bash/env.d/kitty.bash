[[ "$UID" == 0 ]] && return
! [[ -d "$HOME/.config/kitty" ]] && return

export KITTY_CFG="$HOME/.config/kitty"
export KITTYRC="$KITTY_CFG/kitty.conf"
