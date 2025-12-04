[[ "$UID" == 0 ]] && return
! [[ -d "$HOME/.org" ]] && return

export ORG_D="$HOME/.org"
[[ -d "$ORG_D/agendas" ]] && export ORG_AGENDAS_D="$ORG_D/agendas"
[[ -d "$ORG_D/journals" ]] && export ORG_JOURNALS_D="$ORG_D/journals"
[[ -d "$ORG_D/contacts" ]] && export ORG_CONTACTS_D="$ORG_D/contacts"
[[ -d "$ORG_D/notes" ]] && export ORG_NOTES_D="$ORG_D/notes"
[[ -d "$ORG_D/todos" ]] && export ORG_TODOS_D="$ORG_D/todos"
