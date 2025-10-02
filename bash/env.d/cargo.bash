#
# $ENV_D/cargo.bash
#

if _cmd 'cargo'; then
    [[ -d "$HOME/.cargo/bin" ]] && __append2path "$HOME/.cargo/bin"

    # mkdir -p /tmp/cargo.d
    #
    # [[ -d /tmp/cargo.d ]] && export CARGO_TARGET_DIR="/tmp/cargo.d"
    unset CARGO_TARGET_DIR
fi

if _cmd 'rustc'; then
	[[ -f "$(rustc --print sysroot)/etc/bash_completion.d/cargo" ]] && \
        . "$(rustc --print sysroot)/etc/bash_completion.d/cargo"
fi
