if [[ $- != *i* ]] || ! _cmd 'foot'; then
    return
fi

export FOOT_CFG="$HOME/.config/foot"
export FOOTRC="$FOOT_CFG/foot.ini"
! [[ -d "$FOOT_CFG" ]] && command mkdir -p "$FOOT_CFG"
