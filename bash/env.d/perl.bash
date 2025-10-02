if _cmd 'cpanm'; then
	export PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"

	export PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
    export PERL_CPANM_OPT="--prompt --reinstall -l $HOME/perl5 --mirror http://cpan.cpantesters.org"
    export PERL_MB_OPT="--install_base $HOME/perl5"
    export PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"

    __append2path "$HOME/perl5/bin"
fi
