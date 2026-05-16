if [[ "$UID" == 0 ]] || ! [[ -d "$HOME/.config/kitty" ]]; then
    return
fi

export KITTY_CFG="$HOME/.config/kitty"
export KITTYRC="$KITTY_CFG/kitty.conf"
