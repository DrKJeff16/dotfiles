if _cmd 'pipenv'; then
    export PIPENV_CACHE_DIR="$HOME/.cache/Pipenv"
    ! [[ -d "$PIPENV_CACHE_DIR" ]] && mkdir -pv "$PIPENV_CACHE_DIR"
    export PIPENV_NOSPIN=1

    export PIPENV_SHELL_EXPLICIT="/bin/bash"

    export PIPENV_VERBOSE=1
fi
