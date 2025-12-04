! _cmd 'nproc' && return

NPROC="$(nproc)"
export NPROC

MAKEFLAGS="-j${NPROC} -l$(( NPROC + 1 ))"
export MAKEFLAGS

