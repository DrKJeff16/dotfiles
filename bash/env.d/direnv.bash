if [[ $- != *i* ]] || ! _cmd 'direnv' || ! [[ -z ${DIRENV_ACTIVATED+x} ]]; then
    return
fi

eval "$(direnv hook bash)"
export DIRENV_ACTIVATED=1
