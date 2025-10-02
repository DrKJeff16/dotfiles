[[ $- != *i* ]] && return

if _cmd 'foot'; then
    export FOOT_CFG="$HOME/.config/foot"
    ! [[ -d "$FOOT_CFG" ]] && mkdir -p "$FOOT_CFG"
    export FOOTRC="$FOOT_CFG/foot.ini"
fi
