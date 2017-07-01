#! /bin/sh

set -e

if [ "${SCHEDULE}" = "**None**" ]; then
  sh backup.sh
else
  exec go-cron "$SCHEDULE" /bin/sh cleanup.sh
fi