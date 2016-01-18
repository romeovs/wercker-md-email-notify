#!/bin/sh

if [ "$WERCKER_MD_MAIL_NOTIFY_SSL" = "yes" ]; then
  SSL="--ssl"
fi

# npm-install -g md-mailer
md-mailer $SSL -h "$WERCKER_MD_MAIL_NOTIFY_HOST" -u "$WERCKER_MD_MAIL_NOTIFY_USER" "$WERCKER_MD_NOTIFY_FILE"

