[[ "$UID" == 0 ]] && return

! [[ -d "$HOME/.config/chadwm" ]] && return
! [[ -x "$HOME/.config/chadwm/scripts/run.sh" ]] && return

export CHADWM_CFG="$HOME/.config/chadwm"

[[ $- != *i* ]] && return
! [[ -d "$HOME/.config/eww" ]] && cp -r "$CHADWM_CFG/eww" "$HOME/.config/eww"
! [[ -f "$HOME/.Xresources" ]] && cp -r "$CHADWM_CFG/.Xresources" "$HOME"
