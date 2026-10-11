if ! _cmd 'ruby' || ! which 'gem' &> /dev/null; then
    return
fi

GEM_HOME="$(gem env user_gemhome 2> /dev/null)"
export GEM_HOME

__append2path "$GEM_HOME/bin"

! _cmd 'rbenv' && return
eval "$(rbenv init -)"
