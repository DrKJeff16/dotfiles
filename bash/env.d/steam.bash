[[ "$UID" == 0 ]] && return
! _cmd 'steam-runtime' && return

! [[ -d "$HOME/.local/share/Steam" ]] && return

export STEAM_DIR="$HOME/.local/share/Steam"
