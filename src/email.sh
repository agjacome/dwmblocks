#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

declare -i unread_emails=0

for maildir in $(find $HOME/var/mail/*/Inbox/new -type d); do
    unread_emails=$((unread_emails + $(ls -1 $maildir | wc -l)))
done

echo -n "${unread_emails}"
