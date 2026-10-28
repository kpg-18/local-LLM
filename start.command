#!/bin/bash
cd "/Volumes/KPG" || exit 1

exec "./llamafile" \
  -m "qwen3-4b-thinking-2507.Q4_K_M.gguf" \
  --server \
  --host 127.0.0.1 \
  --port 8080