[[ $- != *i* ]] && return
! _cmd 'pipx' && return

pipx ensurepath &> /dev/null
eval "$(register-python-argcomplete pipx)"
