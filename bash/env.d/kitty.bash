[[ "$UID" == 0 ]] && return

if [[ -d "$HOME/.config/kitty" ]]; then
    export KITTY_CFG="$HOME/.config/kitty"
    export KITTYRC="$KITTY_CFG/kitty.conf"
fi
