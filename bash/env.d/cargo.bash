#
# $ENV_D/cargo.bash
#

# shellcheck disable=SC1090

! _cmd 'cargo' 'rustc' && return

if _cmd 'cargo' && [[ -d "$HOME/.cargo/bin" ]]; then
    __append2path "$HOME/.cargo/bin"
fi

if _cmd 'rustc'; then
    COMP_PATH="$(rustc --print sysroot)/etc/bash_completion.d/cargo"
    [[ -f "${COMP_PATH}" ]] && . "${COMP_PATH}"

    unset COMP_PATH
fi
