export QT_QPA_PLATFORM=xcb
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export MOZ_ENABLE_WAYLAND=1

PS1='\[\e[m\]\[\e[1;32m\][\[\e[1;33m\]\u@\h\[\e[m\] \[\e[1;91;100m\]\W\[\e[m\]\[\e[1;32m\]]\[\e[97m\]\$\[\e[m\] '
export PS1
# vim:ts=4:sts=4:sw=4:et:ft=sh:
