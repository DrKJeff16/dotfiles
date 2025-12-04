[[ $- != *i* ]] && return
! _cmd 'foot' && return

export FOOT_CFG="$HOME/.config/foot"
export FOOTRC="$FOOT_CFG/foot.ini"
! [[ -d "$FOOT_CFG" ]] && mkdir -p "$FOOT_CFG"
