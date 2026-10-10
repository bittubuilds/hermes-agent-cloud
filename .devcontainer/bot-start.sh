#!/bin/bash
# Auto-start the Hermes WhatsApp bot on codespace boot (idempotent)
LOG=/tmp/bot-start.log
echo "[$(date +%T)] bot-start invoked" >> $LOG
nohup hermes gateway > ~/gateway.log 2>&1 &
echo "[$(date +%T)] hermes gateway started (model: nous longcat-2.5-preview:free)" >> $LOG
