[[ $- != *i* ]] && return

if _cmd 'ssh-agent' && ! [[ -z ${XDG_RUNTIME_DIR+X} ]] && [[ -d "$XDG_RUNTIME_DIR" ]]; then
    # export SSH_AGENT_PID=""
    # export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/gnupg/S.gpg-agent.ssh"

    unset SSH_AGENT_PID
    if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
        SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket 2> /dev/null)"
        export SSH_AUTH_SOCK
    fi

    # eval "$(ssh-agent)" &> /dev/null

    ! pgrep -u "$USER" ssh-agent &> /dev/null && ssh-agent -t 1h >| "$XDG_RUNTIME_DIR/ssh-agent.env"
    ! [[ -f "$SSH_AUTH_SOCK" ]] && "$XDG_RUNTIME_DIR/ssh-agent.env" &> /dev/null
fi
