if _cmd 'tmux'; then
    export TMUX_CFG="$HOME/.tmux.conf"
    [[ -d "$HOME/.tmux" ]] && export DOT_TMUX="$HOME/.tmux"
fi
