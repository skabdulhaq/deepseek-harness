#!/bin/bash
set -e

echo "[+] Starting DeepSeek Harness v1 web server..."

pnpm dsh web --port 3081 &

APP_PID=$!

echo "[+] Starting socat: 0.0.0.0:3080 -> 127.0.0.1:3080"

socat TCP-LISTEN:3080,fork,reuseaddr TCP:127.0.0.1:3081 &

SOCAT_PID=$!

cleanup() {
    echo "[+] Shutting down..."
    kill "$APP_PID" "$SOCAT_PID" 2>/dev/null || true
}

trap cleanup SIGTERM SIGINT

wait "$APP_PID"
