#!/bin/sh

# Checks mails
echo "Syncing mail"
~/.config/mutt/etc/mailsync.sh > /dev/null 2>/dev/null

# Checks amount of mails
unread=$(find ~/.mail/*/INBOX/new | grep new/ | wc | awk '{print $1;}')

if [ "$unread" != "0" ]; then
    echo $unread
else
    echo ""
fi
