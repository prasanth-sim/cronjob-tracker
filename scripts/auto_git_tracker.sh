#!/bin/bash

cd /full/path/to/cronjob-tracker

# Track any changes to crontab
if ! git diff --quiet crontab/master.cron; then
  git add crontab/master.cron
  git commit -m "Crontab updated: $(date)"
fi
