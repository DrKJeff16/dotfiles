[[ $- != *i* ]] && return

if _cmd 'direnv' && [[ -z ${DIRENV_ACTIVATED+X} ]]; then
    eval "$(direnv hook bash)"
    export DIRENV_ACTIVATED=1
fi
