#!/bin/bash
# Auto-start the Hermes WhatsApp bot stack (idempotent, safe to re-run)
LOG=/tmp/bot-start.log
echo "[$(date +%T)] bot-start invoked" >> $LOG

# 1) Ollama with 64K q4-KV config (skip if already up)
if ! curl -s --max-time 2 http://127.0.0.1:11434/api/version >/dev/null 2>&1; then
  echo "[$(date +%T)] starting ollama" >> $LOG
  OLLAMA_FLASH_ATTENTION=1 OLLAMA_KV_CACHE_TYPE=q4_0 OLLAMA_LOAD_TIMEOUT=15m \
  OLLAMA_KEEP_ALIVE=24h OLLAMA_CONTEXT_LENGTH=65536 \
  nohup ollama serve > /tmp/ollama.log 2>&1 &
  for i in $(seq 1 30); do
    curl -s --max-time 2 http://127.0.0.1:11434/api/version >/dev/null 2>&1 && break
    sleep 2
  done
fi

# 2) Hermes gateway (exits harmlessly if one already serves)
echo "[$(date +%T)] starting hermes gateway" >> $LOG
nohup hermes gateway > ~/gateway.log 2>&1 &

# 3) Warm-load model at 64K in background (first reply stays fast)
sleep 20
echo "[$(date +%T)] warm-loading llama3.2-1b-1t @64K" >> $LOG
nohup curl -s --max-time 1800 http://127.0.0.1:11434/api/chat \
  -d '{"model":"llama3.2-1b-1t","messages":[{"role":"user","content":"hi"}],"stream":false,"options":{"num_ctx":65536,"num_predict":4}}' \
  > /dev/null 2>&1 &
echo "[$(date +%T)] bot-start done (warm load in background)" >> $LOG
