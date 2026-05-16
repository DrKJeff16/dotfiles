if ! [[ -z ${PROJ_D+X} ]]; then
    return
fi

export PROJ_D="$HOME/Projects"
! [[ -d "$HOME/Projects" ]] && command mkdir -p "$PROJ_D"
