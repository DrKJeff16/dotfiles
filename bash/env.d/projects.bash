! [[ -z ${PROJ_D+X} ]] && return

export PROJ_D="$HOME/Projects"
! [[ -d "$HOME/Projects" ]] && command mkdir -p "$PROJ_D"
