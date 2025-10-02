# ---------------TERMINAL EMULATORS---------------
# TODO: Add More Terminal Emulators
# KITTY
[[ "$UID" == 0 ]] && return

if _cmd 'kitty' ; then
	export KITTY_CFG_D="$HOME/.config/kitty"
	export KITTY_CFG="$KITTY_CFG_D/kitty.conf"
fi

# TERMINATOR
if _cmd 'terminator' ; then
	export TERMINATOR_CFG_D="$HOME/.config/terminator"
	export TERMINATOR_CFG="$KITTY_CONF_D/config"
fi

# ---------------TEXT EDITORS---------------

