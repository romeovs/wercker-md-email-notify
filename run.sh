#!/bin/sh

# check if required properties are set.
if [ ! -n "$WERCKER_MD_EMAIL_NOTIFY_HOST" ]; then
  error "Please specify \`host\` property"
  exit 1
fi

if [ ! -n "$WERCKER_MD_EMAIL_NOTIFY_USER" ]; then
  error "Please specify \`user\` property"
  exit 1
fi

if [ ! -n "$WERCKER_MD_EMAIL_NOTIFY_PASS" ]; then
  error "Please specify \`pass\` property"
  exit 1
fi

if [ ! -n "$WERCKER_MD_EMAIL_NOTIFY_FILE" ]; then
  error "Please specify \`file\` property"
  exit 1
fi

# set the ssl option
if [ "$WERCKER_MD_EMAIL_NOTIFY_SSL" = "yes" ]; then
  SSL="--ssl"
fi

# if port is set, use it
if [ -n "$WERCKER_MD_EMAIL_NOTIFY_PORT" ]; then
  PORT="-P"
  PORTN="$WERCKER_MD_EMAIL_NOTIFY_PORT"
fi

# Skip if `on` is set to `failed` and build passed.
if [ "$WERCKER_MD_EMAIL_NOTIFY_ON" = "failed" ]; then
  if [ "$WERCKER_RESULT" = "passed" ]; then
    echo "Build passed, skipping..."
    return 0
  fi
fi

"$WERCKER_STEP_ROOT/node_modules/build/cli.js"
  -h "$WERCKER_MD_EMAIL_NOTIFY_HOST" \
  -u "$WERCKER_MD_EMAIL_NOTIFY_USER" \
  -p "$WERCKER_MD_EMAIL_NOTIFY_PASS" \
      $SSL  \
      $PORT "$PORTN" \
     "$WERCKER_MD_EMAIL_NOTIFY_FILE"
