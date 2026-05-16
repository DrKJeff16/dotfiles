if [[ $- != *i* ]] || ! _cmd 'pipx'; then
    return
fi

pipx ensurepath &> /dev/null
eval "$(register-python-argcomplete pipx)"
