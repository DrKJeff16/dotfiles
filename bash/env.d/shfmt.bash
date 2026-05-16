if [[ $- != *i* ]] || ! which 'shfmt' &> /dev/null; then
    return
fi

shfmt() {
    command shfmt -i 0 -ci -sr -kp "$@"
    return $?
}
export -f shfmt
