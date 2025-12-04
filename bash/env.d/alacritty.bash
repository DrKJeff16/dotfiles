! _cmd 'alacritty' && return

export ALACRITTY_CFG="$HOME/.config/alacritty"
export ALACRITTYRC="$ALACRITTY_CFG/alacritty.toml"

! [[ -d "$ALACRITTY_CFG" ]] && mkdir -p "$ALACRITTY_CFG"
