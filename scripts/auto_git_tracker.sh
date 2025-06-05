#!/bin/bash

cd /home/prasanth/cronjob-tracker

LOGFILE="/home/prasanth/cronjob-tracker/git_push.log"

# Get current Linux username (user who owns the crontab)
WHO_CHANGED=$(whoami)
WHEN=$(date)
COMMIT_MSG="Crontab changed by $WHO_CHANGED on $WHEN"

# Check for changes in the crontab file
if ! git diff --quiet crontab/master.cron; then
  git add crontab/master.cron
  git commit -m "$COMMIT_MSG"
  git push origin main >> "$LOGFILE" 2>&1
  echo "$COMMIT_MSG pushed at $WHEN" >> "$LOGFILE"
fi
