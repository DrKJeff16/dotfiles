[[ "$UID" == 0 ]] && return

if [[ -d "$HOME/.config/chadwm" ]] && [[ -x "$HOME/.config/chadwm/scripts/run.sh" ]]; then
    export CHADWM_CFG="$HOME/.config/chadwm"

    [[ $- != *i* ]] && return
    ! [[ -d "$HOME/.config/eww" ]] && cp -r "$CHADWM_CFG/eww" "$HOME/.config/eww"
    ! [[ -f "$HOME/.Xresources" ]] && cp -r "$CHADWM_CFG/.Xresources" "$HOME"
fi
