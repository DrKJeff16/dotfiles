[[ $- != *i* ]] && return

! _cmd 'direnv' && return
! [[ -z ${DIRENV_ACTIVATED+x} ]] && return

eval "$(direnv hook bash)"
export DIRENV_ACTIVATED=1
