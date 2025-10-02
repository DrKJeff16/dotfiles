[[ $- != *i* ]] && return

if which 'shfmt' &> /dev/null ; then

    shfmt() {
        command shfmt -i 0 -ci -sr -kp "$@"
        return $?
    }

    export -f shfmt
fi
