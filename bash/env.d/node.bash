[[ $- != *i* ]] && return
! _cmd 'npm' && return

[[ -f "$HOME/.npmrc" ]] && export NPMRC="$HOME/.npmrc"
