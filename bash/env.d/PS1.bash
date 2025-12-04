[[ $- != *i* ]] && return

PS1='\[\e[m\]'

if _cmd '__prompt_ec'; then
    PS1+='\[\e[1;91m\]$(__prompt_ec $?)\[\e[m\]'
fi

PS1+='\[\e[1;92m\][\[\e[36m\]\u\[\e[31m\]@\[\e[34m\]\h \[\e[95;40m\]\W\[\e[m\]\[\e[1;92m\]]\[\e[m\]'

if _cmd '__git_ps1'; then
    PS1+='$(__git_ps1)'
fi

PS1+=' \[\e[1m\]\[\e[96m\]\$\[\e[m\]\[\e[1m\]:\[\e[m\] '

export PS1

