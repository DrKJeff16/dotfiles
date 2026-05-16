if ! _cmd 'go' || ! [[ -d "$HOME/go/bin" ]]; then
    return
fi

__append2path "$HOME/go/bin"
