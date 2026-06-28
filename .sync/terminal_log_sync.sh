#!/usr/bin/env bash
# Real-Time Terminal Logging & Sync Script
# Captures all terminal activity and syncs to GitHub, GitLab, and Google Drive
# Created: 2026-06-28 by Oz Agent

set -euo pipefail

LOG_BASE_DIR="/Users/chip/.terminal_logs"
REPO_DIR="/Users/chip/phone_inventory/18_Audit_Report/terminal_logs"
DATE_DIR=$(date +%Y-%m-%d)
TIME_STAMP=$(date +%H-%M-%S)
LOG_FILE="$REPO_DIR/$DATE_DIR/session_$TIME_STAMP.log"
META_FILE="$REPO_DIR/$DATE_DIR/session_$TIME_STAMP.meta"

mkdir -p "$REPO_DIR/$DATE_DIR"
mkdir -p "$LOG_BASE_DIR"

# Write metadata
cat > "$META_FILE" << EOF
# Terminal Session Metadata
# Date: $(date '+%Y-%m-%d %H:%M:%S %Z')
# User: $(whoami)
# Host: $(hostname)
# Working Directory: $(pwd)
# Shell: $SHELL
# PID: $$
# Parent PID: $PPID
# TTY: $(tty 2>/dev/null || echo "unknown")
# Commands executed during this session are logged in the corresponding .log file
EOF

# Function to sync logs to all platforms
sync_logs() {
    local file="$1"
    cd /Users/chip/phone_inventory || return
    
    # Add, commit, and push to GitHub
    git add -A 2>/dev/null || true
    git commit -m "Auto-log: $(date '+%Y-%m-%d %H:%M:%S') terminal activity

Co-Authored-By: Oz <oz-agent@warp.dev>" 2>/dev/null || true
    git push origin WSD:main 2>/dev/null || true
    
    # Push to GitLab if configured
    if git remote get-url gitlab >/dev/null 2>&1; then
        git push gitlab WSD:main 2>/dev/null || true
    fi
    
    # Sync to Google Drive via rclone if configured
    if rclone listremotes 2>/dev/null | grep -q "^gdrive:"; then
        rclone sync "$REPO_DIR" "gdrive:WSD-junior-Enterprise-Inc-SM-S156V/terminal_logs" \
            --exclude '.git/**' --exclude '.sync/**' 2>/dev/null || true
    fi
}

# Export the sync function
export -f sync_logs
export REPO_DIR

# Start the script command for logging
# Use script to capture all terminal output
echo "=== Terminal logging started at $(date) ===" >> "$LOG_FILE"
echo "=== Session will be auto-synced to GitHub, GitLab, Google Drive ===" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"

# Set up background sync every 60 seconds
(
    while true; do
        sleep 60
        sync_logs "$LOG_FILE" &
    done
) &
SYNC_PID=$!

# Use the script command to capture terminal output
# This is a wrapper - actual usage would be: script -f -q "$LOG_FILE"
# For now, we provide the setup and instructions

echo "Terminal logging configured."
echo "Log file: $LOG_FILE"
echo "Metadata: $META_FILE"
echo "Auto-sync interval: 60 seconds"
echo ""
echo "To start a fully logged session, run:"
echo "  script -f -q $LOG_FILE"
echo ""
echo "Or add this to your ~/.zshrc to auto-log all sessions:"
echo "  if [ -z \"\$TERM_LOG\" ]; then"
echo "    export TERM_LOG=1"
echo "    script -f -q \$LOG_BASE_DIR/\$(date +%Y-%m-%d-%H%M%S).log"
echo "  fi"
echo ""
echo "Sync daemon PID: $SYNC_PID"
