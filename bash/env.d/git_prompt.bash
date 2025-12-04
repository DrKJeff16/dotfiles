[[ $- != *i* ]] && return
! [[ -r /usr/share/git/git-prompt.sh ]] && return

. /usr/share/git/git-prompt.sh

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM='auto'
export GIT_PS1_SHOWCONFLICTSTATE='yes'
export GIT_PS1_SHOWCOLORHINTS=1
