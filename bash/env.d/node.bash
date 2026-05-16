if [[ $- != *i* ]] || ! _cmd 'npm'; then
    return
fi

[[ -f "$HOME/.npmrc" ]] && export NPMRC="$HOME/.npmrc"
