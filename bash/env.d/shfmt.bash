[[ $- != *i* ]] && return

! which 'shfmt' &> /dev/null && return

shfmt() {
    command shfmt -i 0 -ci -sr -kp "$@"
    return $?
}
export -f shfmt
