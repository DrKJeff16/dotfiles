if ! _cmd 'wezterm'; then
    return
fi

export WEZTERM_D="${HOME}/.config/wezterm"

if [[ -r "${WEZTERM_D}/wezterm.lua" ]]; then
    export WEZTERMRC="${WEZTERM_D}/wezterm.lua"
elif [[ -r "${HOME}/.wezterm.lua" ]]; then
    export WEZTERMRC="${HOME}/.wezterm.lua"
fi

__cond_src /etc/profile.d/wezterm.sh
