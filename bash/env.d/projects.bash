#!/bin/bash

! [[ -z ${PROJ_D+X} ]] && return

if [[ -d "$HOME/Projects" ]] ; then
	export PROJ_D="$HOME/Projects"
fi
