#!/bin/bash
# Stop the Node.js application by killing its process

echo "Stopping application..."

PID_FILE="/var/run/myapp.pid"

if [ -f "$PID_FILE" ]; then
    PID=$(cat "$PID_FILE")
    echo "Killing process $PID"
    kill "$PID" || true
    rm "$PID_FILE"
    echo "Application stopped."
else
    echo "PID file not found. Application might not be running."
fi
