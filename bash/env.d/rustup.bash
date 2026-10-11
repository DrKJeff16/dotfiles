_rustup() {
    local i cur prev opts cmd
    COMPREPLY=()
    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
        cur="$2"
    else
        cur="${COMP_WORDS[COMP_CWORD]}"
    fi
    prev="$3"
    cmd=""
    opts=""

    for i in "${COMP_WORDS[@]:0:COMP_CWORD}"; do
        case "${cmd},${i}" in
            ",$1")
                cmd="rustup"
                ;;
            rustup,check)
                cmd="rustup__subcmd__check"
                ;;
            rustup,completions)
                cmd="rustup__subcmd__completions"
                ;;
            rustup,component)
                cmd="rustup__subcmd__component"
                ;;
            rustup,default)
                cmd="rustup__subcmd__default"
                ;;
            rustup,doc)
                cmd="rustup__subcmd__doc"
                ;;
            rustup,dump-testament)
                cmd="rustup__subcmd__dump__subcmd__testament"
                ;;
            rustup,help)
                cmd="rustup__subcmd__help"
                ;;
            rustup,install)
                cmd="rustup__subcmd__install"
                ;;
            rustup,man)
                cmd="rustup__subcmd__man"
                ;;
            rustup,override)
                cmd="rustup__subcmd__override"
                ;;
            rustup,run)
                cmd="rustup__subcmd__run"
                ;;
            rustup,self)
                cmd="rustup__subcmd__self"
                ;;
            rustup,set)
                cmd="rustup__subcmd__set"
                ;;
            rustup,show)
                cmd="rustup__subcmd__show"
                ;;
            rustup,target)
                cmd="rustup__subcmd__target"
                ;;
            rustup,toolchain)
                cmd="rustup__subcmd__toolchain"
                ;;
            rustup,uninstall)
                cmd="rustup__subcmd__uninstall"
                ;;
            rustup,update)
                cmd="rustup__subcmd__update"
                ;;
            rustup,which)
                cmd="rustup__subcmd__which"
                ;;
            rustup__subcmd__component,add)
                cmd="rustup__subcmd__component__subcmd__add"
                ;;
            rustup__subcmd__component,help)
                cmd="rustup__subcmd__component__subcmd__help"
                ;;
            rustup__subcmd__component,list)
                cmd="rustup__subcmd__component__subcmd__list"
                ;;
            rustup__subcmd__component,remove)
                cmd="rustup__subcmd__component__subcmd__remove"
                ;;
            rustup__subcmd__component__subcmd__help,add)
                cmd="rustup__subcmd__component__subcmd__help__subcmd__add"
                ;;
            rustup__subcmd__component__subcmd__help,help)
                cmd="rustup__subcmd__component__subcmd__help__subcmd__help"
                ;;
            rustup__subcmd__component__subcmd__help,list)
                cmd="rustup__subcmd__component__subcmd__help__subcmd__list"
                ;;
            rustup__subcmd__component__subcmd__help,remove)
                cmd="rustup__subcmd__component__subcmd__help__subcmd__remove"
                ;;
            rustup__subcmd__help,check)
                cmd="rustup__subcmd__help__subcmd__check"
                ;;
            rustup__subcmd__help,completions)
                cmd="rustup__subcmd__help__subcmd__completions"
                ;;
            rustup__subcmd__help,component)
                cmd="rustup__subcmd__help__subcmd__component"
                ;;
            rustup__subcmd__help,default)
                cmd="rustup__subcmd__help__subcmd__default"
                ;;
            rustup__subcmd__help,doc)
                cmd="rustup__subcmd__help__subcmd__doc"
                ;;
            rustup__subcmd__help,dump-testament)
                cmd="rustup__subcmd__help__subcmd__dump__subcmd__testament"
                ;;
            rustup__subcmd__help,help)
                cmd="rustup__subcmd__help__subcmd__help"
                ;;
            rustup__subcmd__help,install)
                cmd="rustup__subcmd__help__subcmd__install"
                ;;
            rustup__subcmd__help,man)
                cmd="rustup__subcmd__help__subcmd__man"
                ;;
            rustup__subcmd__help,override)
                cmd="rustup__subcmd__help__subcmd__override"
                ;;
            rustup__subcmd__help,run)
                cmd="rustup__subcmd__help__subcmd__run"
                ;;
            rustup__subcmd__help,self)
                cmd="rustup__subcmd__help__subcmd__self"
                ;;
            rustup__subcmd__help,set)
                cmd="rustup__subcmd__help__subcmd__set"
                ;;
            rustup__subcmd__help,show)
                cmd="rustup__subcmd__help__subcmd__show"
                ;;
            rustup__subcmd__help,target)
                cmd="rustup__subcmd__help__subcmd__target"
                ;;
            rustup__subcmd__help,toolchain)
                cmd="rustup__subcmd__help__subcmd__toolchain"
                ;;
            rustup__subcmd__help,uninstall)
                cmd="rustup__subcmd__help__subcmd__uninstall"
                ;;
            rustup__subcmd__help,update)
                cmd="rustup__subcmd__help__subcmd__update"
                ;;
            rustup__subcmd__help,which)
                cmd="rustup__subcmd__help__subcmd__which"
                ;;
            rustup__subcmd__help__subcmd__component,add)
                cmd="rustup__subcmd__help__subcmd__component__subcmd__add"
                ;;
            rustup__subcmd__help__subcmd__component,list)
                cmd="rustup__subcmd__help__subcmd__component__subcmd__list"
                ;;
            rustup__subcmd__help__subcmd__component,remove)
                cmd="rustup__subcmd__help__subcmd__component__subcmd__remove"
                ;;
            rustup__subcmd__help__subcmd__override,list)
                cmd="rustup__subcmd__help__subcmd__override__subcmd__list"
                ;;
            rustup__subcmd__help__subcmd__override,set)
                cmd="rustup__subcmd__help__subcmd__override__subcmd__set"
                ;;
            rustup__subcmd__help__subcmd__override,unset)
                cmd="rustup__subcmd__help__subcmd__override__subcmd__unset"
                ;;
            rustup__subcmd__help__subcmd__self,uninstall)
                cmd="rustup__subcmd__help__subcmd__self__subcmd__uninstall"
                ;;
            rustup__subcmd__help__subcmd__self,update)
                cmd="rustup__subcmd__help__subcmd__self__subcmd__update"
                ;;
            rustup__subcmd__help__subcmd__self,upgrade-data)
                cmd="rustup__subcmd__help__subcmd__self__subcmd__upgrade__subcmd__data"
                ;;
            rustup__subcmd__help__subcmd__set,auto-install)
                cmd="rustup__subcmd__help__subcmd__set__subcmd__auto__subcmd__install"
                ;;
            rustup__subcmd__help__subcmd__set,auto-self-update)
                cmd="rustup__subcmd__help__subcmd__set__subcmd__auto__subcmd__self__subcmd__update"
                ;;
            rustup__subcmd__help__subcmd__set,default-host)
                cmd="rustup__subcmd__help__subcmd__set__subcmd__default__subcmd__host"
                ;;
            rustup__subcmd__help__subcmd__set,profile)
                cmd="rustup__subcmd__help__subcmd__set__subcmd__profile"
                ;;
            rustup__subcmd__help__subcmd__show,active-toolchain)
                cmd="rustup__subcmd__help__subcmd__show__subcmd__active__subcmd__toolchain"
                ;;
            rustup__subcmd__help__subcmd__show,home)
                cmd="rustup__subcmd__help__subcmd__show__subcmd__home"
                ;;
            rustup__subcmd__help__subcmd__show,profile)
                cmd="rustup__subcmd__help__subcmd__show__subcmd__profile"
                ;;
            rustup__subcmd__help__subcmd__target,add)
                cmd="rustup__subcmd__help__subcmd__target__subcmd__add"
                ;;
            rustup__subcmd__help__subcmd__target,list)
                cmd="rustup__subcmd__help__subcmd__target__subcmd__list"
                ;;
            rustup__subcmd__help__subcmd__target,remove)
                cmd="rustup__subcmd__help__subcmd__target__subcmd__remove"
                ;;
            rustup__subcmd__help__subcmd__toolchain,install)
                cmd="rustup__subcmd__help__subcmd__toolchain__subcmd__install"
                ;;
            rustup__subcmd__help__subcmd__toolchain,link)
                cmd="rustup__subcmd__help__subcmd__toolchain__subcmd__link"
                ;;
            rustup__subcmd__help__subcmd__toolchain,list)
                cmd="rustup__subcmd__help__subcmd__toolchain__subcmd__list"
                ;;
            rustup__subcmd__help__subcmd__toolchain,uninstall)
                cmd="rustup__subcmd__help__subcmd__toolchain__subcmd__uninstall"
                ;;
            rustup__subcmd__override,help)
                cmd="rustup__subcmd__override__subcmd__help"
                ;;
            rustup__subcmd__override,list)
                cmd="rustup__subcmd__override__subcmd__list"
                ;;
            rustup__subcmd__override,set)
                cmd="rustup__subcmd__override__subcmd__set"
                ;;
            rustup__subcmd__override,unset)
                cmd="rustup__subcmd__override__subcmd__unset"
                ;;
            rustup__subcmd__override__subcmd__help,help)
                cmd="rustup__subcmd__override__subcmd__help__subcmd__help"
                ;;
            rustup__subcmd__override__subcmd__help,list)
                cmd="rustup__subcmd__override__subcmd__help__subcmd__list"
                ;;
            rustup__subcmd__override__subcmd__help,set)
                cmd="rustup__subcmd__override__subcmd__help__subcmd__set"
                ;;
            rustup__subcmd__override__subcmd__help,unset)
                cmd="rustup__subcmd__override__subcmd__help__subcmd__unset"
                ;;
            rustup__subcmd__self,help)
                cmd="rustup__subcmd__self__subcmd__help"
                ;;
            rustup__subcmd__self,uninstall)
                cmd="rustup__subcmd__self__subcmd__uninstall"
                ;;
            rustup__subcmd__self,update)
                cmd="rustup__subcmd__self__subcmd__update"
                ;;
            rustup__subcmd__self,upgrade-data)
                cmd="rustup__subcmd__self__subcmd__upgrade__subcmd__data"
                ;;
            rustup__subcmd__self__subcmd__help,help)
                cmd="rustup__subcmd__self__subcmd__help__subcmd__help"
                ;;
            rustup__subcmd__self__subcmd__help,uninstall)
                cmd="rustup__subcmd__self__subcmd__help__subcmd__uninstall"
                ;;
            rustup__subcmd__self__subcmd__help,update)
                cmd="rustup__subcmd__self__subcmd__help__subcmd__update"
                ;;
            rustup__subcmd__self__subcmd__help,upgrade-data)
                cmd="rustup__subcmd__self__subcmd__help__subcmd__upgrade__subcmd__data"
                ;;
            rustup__subcmd__set,auto-install)
                cmd="rustup__subcmd__set__subcmd__auto__subcmd__install"
                ;;
            rustup__subcmd__set,auto-self-update)
                cmd="rustup__subcmd__set__subcmd__auto__subcmd__self__subcmd__update"
                ;;
            rustup__subcmd__set,default-host)
                cmd="rustup__subcmd__set__subcmd__default__subcmd__host"
                ;;
            rustup__subcmd__set,help)
                cmd="rustup__subcmd__set__subcmd__help"
                ;;
            rustup__subcmd__set,profile)
                cmd="rustup__subcmd__set__subcmd__profile"
                ;;
            rustup__subcmd__set__subcmd__help,auto-install)
                cmd="rustup__subcmd__set__subcmd__help__subcmd__auto__subcmd__install"
                ;;
            rustup__subcmd__set__subcmd__help,auto-self-update)
                cmd="rustup__subcmd__set__subcmd__help__subcmd__auto__subcmd__self__subcmd__update"
                ;;
            rustup__subcmd__set__subcmd__help,default-host)
                cmd="rustup__subcmd__set__subcmd__help__subcmd__default__subcmd__host"
                ;;
            rustup__subcmd__set__subcmd__help,help)
                cmd="rustup__subcmd__set__subcmd__help__subcmd__help"
                ;;
            rustup__subcmd__set__subcmd__help,profile)
                cmd="rustup__subcmd__set__subcmd__help__subcmd__profile"
                ;;
            rustup__subcmd__show,active-toolchain)
                cmd="rustup__subcmd__show__subcmd__active__subcmd__toolchain"
                ;;
            rustup__subcmd__show,help)
                cmd="rustup__subcmd__show__subcmd__help"
                ;;
            rustup__subcmd__show,home)
                cmd="rustup__subcmd__show__subcmd__home"
                ;;
            rustup__subcmd__show,profile)
                cmd="rustup__subcmd__show__subcmd__profile"
                ;;
            rustup__subcmd__show__subcmd__help,active-toolchain)
                cmd="rustup__subcmd__show__subcmd__help__subcmd__active__subcmd__toolchain"
                ;;
            rustup__subcmd__show__subcmd__help,help)
                cmd="rustup__subcmd__show__subcmd__help__subcmd__help"
                ;;
            rustup__subcmd__show__subcmd__help,home)
                cmd="rustup__subcmd__show__subcmd__help__subcmd__home"
                ;;
            rustup__subcmd__show__subcmd__help,profile)
                cmd="rustup__subcmd__show__subcmd__help__subcmd__profile"
                ;;
            rustup__subcmd__target,add)
                cmd="rustup__subcmd__target__subcmd__add"
                ;;
            rustup__subcmd__target,help)
                cmd="rustup__subcmd__target__subcmd__help"
                ;;
            rustup__subcmd__target,list)
                cmd="rustup__subcmd__target__subcmd__list"
                ;;
            rustup__subcmd__target,remove)
                cmd="rustup__subcmd__target__subcmd__remove"
                ;;
            rustup__subcmd__target__subcmd__help,add)
                cmd="rustup__subcmd__target__subcmd__help__subcmd__add"
                ;;
            rustup__subcmd__target__subcmd__help,help)
                cmd="rustup__subcmd__target__subcmd__help__subcmd__help"
                ;;
            rustup__subcmd__target__subcmd__help,list)
                cmd="rustup__subcmd__target__subcmd__help__subcmd__list"
                ;;
            rustup__subcmd__target__subcmd__help,remove)
                cmd="rustup__subcmd__target__subcmd__help__subcmd__remove"
                ;;
            rustup__subcmd__toolchain,help)
                cmd="rustup__subcmd__toolchain__subcmd__help"
                ;;
            rustup__subcmd__toolchain,install)
                cmd="rustup__subcmd__toolchain__subcmd__install"
                ;;
            rustup__subcmd__toolchain,link)
                cmd="rustup__subcmd__toolchain__subcmd__link"
                ;;
            rustup__subcmd__toolchain,list)
                cmd="rustup__subcmd__toolchain__subcmd__list"
                ;;
            rustup__subcmd__toolchain,uninstall)
                cmd="rustup__subcmd__toolchain__subcmd__uninstall"
                ;;
            rustup__subcmd__toolchain__subcmd__help,help)
                cmd="rustup__subcmd__toolchain__subcmd__help__subcmd__help"
                ;;
            rustup__subcmd__toolchain__subcmd__help,install)
                cmd="rustup__subcmd__toolchain__subcmd__help__subcmd__install"
                ;;
            rustup__subcmd__toolchain__subcmd__help,link)
                cmd="rustup__subcmd__toolchain__subcmd__help__subcmd__link"
                ;;
            rustup__subcmd__toolchain__subcmd__help,list)
                cmd="rustup__subcmd__toolchain__subcmd__help__subcmd__list"
                ;;
            rustup__subcmd__toolchain__subcmd__help,uninstall)
                cmd="rustup__subcmd__toolchain__subcmd__help__subcmd__uninstall"
                ;;
            *)
                ;;
        esac
    done

    case "${cmd}" in
        rustup)
            opts="-v -q -h -V --verbose --quiet --help --version install uninstall dump-testament toolchain default show update check target component override run which doc man self set completions help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 1 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__check)
            opts="-h --no-self-update --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__completions)
            opts="-h --help bash elvish fish powershell zsh rustup cargo"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__component)
            opts="-h --help list add remove help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__component__subcmd__add)
            opts="-h --toolchain --target --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                --toolchain)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --target)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__component__subcmd__help)
            opts="list add remove help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__component__subcmd__help__subcmd__add)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__component__subcmd__help__subcmd__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__component__subcmd__help__subcmd__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__component__subcmd__help__subcmd__remove)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__component__subcmd__list)
            opts="-q -h --toolchain --installed --quiet --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                --toolchain)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__component__subcmd__remove)
            opts="-h --toolchain --target --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                --toolchain)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --target)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__default)
            opts="-h --force-non-host --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__doc)
            opts="-h --path --serve --toolchain --alloc --book --cargo --clippy --core --edition-guide --embedded-book --error-codes --nomicon --proc_macro --reference --releases --rust-by-example --rustc --rustc-docs --rustdoc --std --style-guide --test --unstable-book --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                --toolchain)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__dump__subcmd__testament)
            opts="-h --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__help)
            opts="install uninstall dump-testament toolchain default show update check target component override run which doc man self set completions help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__help__subcmd__check)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__help__subcmd__completions)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__help__subcmd__component)
            opts="list add remove"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__help__subcmd__component__subcmd__add)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__help__subcmd__component__subcmd__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__help__subcmd__component__subcmd__remove)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__help__subcmd__default)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__help__subcmd__doc)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__help__subcmd__dump__subcmd__testament)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__help__subcmd__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__help__subcmd__install)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__help__subcmd__man)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__help__subcmd__override)
            opts="list set unset"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__help__subcmd__override__subcmd__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__help__subcmd__override__subcmd__set)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__help__subcmd__override__subcmd__unset)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__help__subcmd__run)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__help__subcmd__self)
            opts="update uninstall upgrade-data"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__help__subcmd__self__subcmd__uninstall)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__help__subcmd__self__subcmd__update)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__help__subcmd__self__subcmd__upgrade__subcmd__data)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__help__subcmd__set)
            opts="default-host profile auto-self-update auto-install"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__help__subcmd__set__subcmd__auto__subcmd__install)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__help__subcmd__set__subcmd__auto__subcmd__self__subcmd__update)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__help__subcmd__set__subcmd__default__subcmd__host)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__help__subcmd__set__subcmd__profile)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__help__subcmd__show)
            opts="active-toolchain home profile"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__help__subcmd__show__subcmd__active__subcmd__toolchain)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__help__subcmd__show__subcmd__home)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__help__subcmd__show__subcmd__profile)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__help__subcmd__target)
            opts="list add remove"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__help__subcmd__target__subcmd__add)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__help__subcmd__target__subcmd__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__help__subcmd__target__subcmd__remove)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__help__subcmd__toolchain)
            opts="list install uninstall link"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__help__subcmd__toolchain__subcmd__install)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__help__subcmd__toolchain__subcmd__link)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__help__subcmd__toolchain__subcmd__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__help__subcmd__toolchain__subcmd__uninstall)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__help__subcmd__uninstall)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__help__subcmd__update)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__help__subcmd__which)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__install)
            opts="-c -t -h --profile --component --target --no-self-update --no-update --force --allow-downgrade --force-non-host --override --default --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                --profile)
                    COMPREPLY=($(compgen -W "minimal default complete" -- "${cur}"))
                    return 0
                    ;;
                --component)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --target)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -t)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__man)
            opts="-h --toolchain --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                --toolchain)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__override)
            opts="-h --help list set unset help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__override__subcmd__help)
            opts="list set unset help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__override__subcmd__help__subcmd__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__override__subcmd__help__subcmd__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__override__subcmd__help__subcmd__set)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__override__subcmd__help__subcmd__unset)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__override__subcmd__list)
            opts="-h --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__override__subcmd__set)
            opts="-h --path --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                --path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__override__subcmd__unset)
            opts="-h --path --nonexistent --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                --path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__run)
            opts="-h --install --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__self)
            opts="-h --help update uninstall upgrade-data help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__self__subcmd__help)
            opts="update uninstall upgrade-data help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__self__subcmd__help__subcmd__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__self__subcmd__help__subcmd__uninstall)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__self__subcmd__help__subcmd__update)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__self__subcmd__help__subcmd__upgrade__subcmd__data)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__self__subcmd__uninstall)
            opts="-y -h --yes --no-modify-path --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__self__subcmd__update)
            opts="-h --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__self__subcmd__upgrade__subcmd__data)
            opts="-h --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__set)
            opts="-h --help default-host profile auto-self-update auto-install help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__set__subcmd__auto__subcmd__install)
            opts="-h --help enable disable"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__set__subcmd__auto__subcmd__self__subcmd__update)
            opts="-h --help enable disable check-only"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__set__subcmd__default__subcmd__host)
            opts="-h --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__set__subcmd__help)
            opts="default-host profile auto-self-update auto-install help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__set__subcmd__help__subcmd__auto__subcmd__install)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__set__subcmd__help__subcmd__auto__subcmd__self__subcmd__update)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__set__subcmd__help__subcmd__default__subcmd__host)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__set__subcmd__help__subcmd__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__set__subcmd__help__subcmd__profile)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__set__subcmd__profile)
            opts="-h --help minimal default complete"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__show)
            opts="-v -h --verbose --help active-toolchain home profile help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__show__subcmd__active__subcmd__toolchain)
            opts="-v -h --verbose --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__show__subcmd__help)
            opts="active-toolchain home profile help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__show__subcmd__help__subcmd__active__subcmd__toolchain)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__show__subcmd__help__subcmd__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__show__subcmd__help__subcmd__home)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__show__subcmd__help__subcmd__profile)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__show__subcmd__home)
            opts="-h --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__show__subcmd__profile)
            opts="-h --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__target)
            opts="-h --help list add remove help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__target__subcmd__add)
            opts="-h --toolchain --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                --toolchain)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__target__subcmd__help)
            opts="list add remove help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__target__subcmd__help__subcmd__add)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__target__subcmd__help__subcmd__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__target__subcmd__help__subcmd__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__target__subcmd__help__subcmd__remove)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__target__subcmd__list)
            opts="-q -h --toolchain --installed --quiet --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                --toolchain)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__target__subcmd__remove)
            opts="-h --toolchain --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                --toolchain)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__toolchain)
            opts="-h --help list install uninstall link help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__toolchain__subcmd__help)
            opts="list install uninstall link help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__toolchain__subcmd__help__subcmd__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__toolchain__subcmd__help__subcmd__install)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__toolchain__subcmd__help__subcmd__link)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__toolchain__subcmd__help__subcmd__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__toolchain__subcmd__help__subcmd__uninstall)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__toolchain__subcmd__install)
            opts="-c -t -h --profile --component --target --no-self-update --no-update --force --allow-downgrade --force-non-host --override --default --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                --profile)
                    COMPREPLY=($(compgen -W "minimal default complete" -- "${cur}"))
                    return 0
                    ;;
                --component)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --target)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -t)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__toolchain__subcmd__link)
            opts="-h --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__toolchain__subcmd__list)
            opts="-v -q -h --verbose --quiet --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__toolchain__subcmd__uninstall)
            opts="-h --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__uninstall)
            opts="-h --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__update)
            opts="-h --no-self-update --force --force-non-host --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
        rustup__subcmd__which)
            opts="-h --toolchain --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]]; then
                COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
                return 0
            fi
            case "${prev}" in
                --toolchain)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=($( compgen -W "${opts}" -- "${cur}"))
            return 0
            ;;
    esac
}

if [[ "${BASH_VERSINFO[0]}" -eq 4 ]] && [[ "${BASH_VERSINFO[1]}" -ge 4 ]] || [[ "${BASH_VERSINFO[0]}" -gt 4 ]]; then
    complete -F _rustup -o nosort -o bashdefault -o default rustup
else
    complete -F _rustup -o bashdefault -o default rustup
fi
