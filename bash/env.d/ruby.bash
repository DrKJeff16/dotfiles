! which 'gem' &> /dev/null && return

GEM_HOME="$(gem env user_gemhome 2> /dev/null)"
export GEM_HOME

__append2path "$GEM_HOME/bin"
