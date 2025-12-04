! _cmd 'pipenv' && return

export PIPENV_CACHE_DIR="$HOME/.cache/Pipenv"
export PIPENV_NOSPIN=1
export PIPENV_SHELL_EXPLICIT="/bin/bash"
export PIPENV_VERBOSE=1
! [[ -d "$PIPENV_CACHE_DIR" ]] && mkdir -pv "$PIPENV_CACHE_DIR"
