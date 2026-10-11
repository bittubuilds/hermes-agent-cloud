#!/bin/bash
LOG=/tmp/bot-start.log
echo "[$(date +%T)] bot-start invoked" >> $LOG
if pgrep -f hermes_cli >/dev/null 2>&1; then
  echo "[$(date +%T)] gateway already running, skip" >> $LOG
  exit 0
fi
nohup /home/vscode/.local/bin/hermes gateway > ~/gateway.log 2>&1 &
echo "[$(date +%T)] hermes gateway started" >> $LOG
