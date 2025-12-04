! _cmd 'go' && return
! [[ -d "$HOME/go/bin" ]] && return

__append2path "$HOME/go/bin"
