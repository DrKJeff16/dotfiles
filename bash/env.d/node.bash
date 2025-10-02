[[ $- != *i* ]] && return

if _cmd 'npm'; then
    [[ -f "$HOME/.npmrc" ]] && export NPMRC="$HOME/.npmrc"
fi
