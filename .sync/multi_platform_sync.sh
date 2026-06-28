#!/usr/bin/env bash
# Real-Time Multi-Platform Sync Script
# Synchronizes phone_inventory to GitHub, GitLab, and Google Drive
# Author: Oz Agent (WSD junior Enterprise Inc)
# Created: 2026-06-28

set -euo pipefail

# Configuration
WATCH_DIR="/Users/chip/phone_inventory"
GITHUB_REMOTE="origin"
GITLAB_REMOTE="gitlab"
GOOGLE_DRIVE_REMOTE="gdrive"
SYNC_LOG="/Users/chip/phone_inventory/.sync/sync.log"
SYNC_STATE="/Users/chip/phone_inventory/.sync/last_sync.md5"
DEBOUNCE_SECONDS=5

# Ensure sync directory exists
mkdir -p "$(dirname "$SYNC_LOG")"

# Logging function
log() {
    local timestamp
    timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[$timestamp] $*" | tee -a "$SYNC_LOG"
}

# Generate checksum of all files (excluding .git and sync metadata)
generate_checksum() {
    find "$WATCH_DIR" -type f \
        -not -path '*/.git/*' \
        -not -path '*/.sync/*' \
        -not -name '.DS_Store' \
        -exec md5 -q {} \; | sort | md5 -q
}

# Check if files have changed
has_changed() {
    local current_checksum
    current_checksum=$(generate_checksum)
    
    if [[ ! -f "$SYNC_STATE" ]]; then
        echo "$current_checksum" > "$SYNC_STATE"
        return 0
    fi
    
    local last_checksum
    last_checksum=$(cat "$SYNC_STATE")
    
    if [[ "$current_checksum" != "$last_checksum" ]]; then
        echo "$current_checksum" > "$SYNC_STATE"
        return 0
    fi
    
    return 1
}

# Git operations
git_sync() {
    cd "$WATCH_DIR" || return 1
    
    # Check if there are changes to commit
    if git diff --quiet && git diff --cached --quiet; then
        log "No git changes to commit"
        return 0
    fi
    
    log "Committing changes to git..."
    git add -A
    git commit -m "Auto-sync: $(date '+%Y-%m-%d %H:%M:%S') - Multi-platform sync

Real-time synchronization to GitHub, GitLab, and Google Drive.
Co-Authored-By: Oz <oz-agent@warp.dev>" || true
    
    # Push to GitHub
    log "Pushing to GitHub ($GITHUB_REMOTE)..."
    if git push "$GITHUB_REMOTE" WSD:main 2>&1; then
        log "GitHub sync: SUCCESS"
    else
        log "GitHub sync: FAILED - will retry on next cycle"
    fi
    
    # Push to GitLab (if remote exists)
    if git remote get-url "$GITLAB_REMOTE" >/dev/null 2>&1; then
        log "Pushing to GitLab ($GITLAB_REMOTE)..."
        if git push "$GITLAB_REMOTE" WSD:main 2>&1; then
            log "GitLab sync: SUCCESS"
        else
            log "GitLab sync: FAILED - will retry on next cycle"
        fi
    else
        log "GitLab remote not configured - skipping"
    fi
}

# Google Drive sync via rclone
gdrive_sync() {
    cd "$WATCH_DIR" || return 1
    
    # Check if rclone Google Drive remote is configured
    if rclone listremotes 2>/dev/null | grep -q "^${GOOGLE_DRIVE_REMOTE}:"; then
        log "Syncing to Google Drive ($GOOGLE_DRIVE_REMOTE)..."
        if rclone sync "$WATCH_DIR" "${GOOGLE_DRIVE_REMOTE}:WSD-junior-Enterprise-Inc-SM-S156V" \
            --exclude '.git/**' \
            --exclude '.sync/**' \
            --exclude '.DS_Store' \
            --progress 2>&1; then
            log "Google Drive sync: SUCCESS"
        else
            log "Google Drive sync: FAILED - will retry on next cycle"
        fi
    else
        log "Google Drive remote not configured ($GOOGLE_DRIVE_REMOTE) - skipping"
        log "To configure: run 'rclone config' and create a 'gdrive' remote"
    fi
}

# Full sync cycle
sync_cycle() {
    log "=== Starting sync cycle ==="
    
    if ! has_changed; then
        log "No changes detected - skipping sync"
        return 0
    fi
    
    log "Changes detected - initiating multi-platform sync"
    
    git_sync
    gdrive_sync
    
    log "=== Sync cycle complete ==="
}

# Main monitoring loop using fswatch
monitor_fswatch() {
    log "Starting real-time sync monitor (fswatch mode)..."
    log "Watching: $WATCH_DIR"
    log "GitHub remote: $GITHUB_REMOTE"
    log "GitLab remote: $GITLAB_REMOTE (if configured)"
    log "Google Drive remote: $GOOGLE_DRIVE_REMOTE (if configured)"
    
    # Initial sync
    sync_cycle
    
    # Monitor for changes using fswatch
    fswatch -r "$WATCH_DIR" \
        --exclude='\.git' \
        --exclude='\.sync' \
        --exclude='\.DS_Store' \
        --latency="$DEBOUNCE_SECONDS" \
        | while read -r changed_file; do
            log "File changed: $changed_file"
            sync_cycle
        done
}

# Polling fallback (if fswatch is not available)
monitor_poll() {
    log "Starting real-time sync monitor (polling mode)..."
    log "Watching: $WATCH_DIR"
    log "Poll interval: ${DEBOUNCE_SECONDS}s"
    
    # Initial sync
    sync_cycle
    
    # Poll for changes
    while true; do
        sleep "$DEBOUNCE_SECONDS"
        sync_cycle
    done
}

# Main entry point
main() {
    case "${1:-watch}" in
        watch)
            if command -v fswatch >/dev/null 2>&1; then
                monitor_fswatch
            else
                monitor_poll
            fi
            ;;
        sync)
            sync_cycle
            ;;
        status)
            log "Sync status check"
            log "GitHub remote: $(git -C "$WATCH_DIR" remote get-url "$GITHUB_REMOTE" 2>/dev/null || echo 'NOT CONFIGURED')"
            log "GitLab remote: $(git -C "$WATCH_DIR" remote get-url "$GITLAB_REMOTE" 2>/dev/null || echo 'NOT CONFIGURED')"
            log "Google Drive remote: $(rclone listremotes 2>/dev/null | grep "^${GOOGLE_DRIVE_REMOTE}:" || echo 'NOT CONFIGURED')"
            log "Last sync: $(stat -f %Sm "$SYNC_STATE" 2>/dev/null || echo 'NEVER')"
            ;;
        *)
            echo "Usage: $0 {watch|sync|status}"
            exit 1
            ;;
    esac
}

main "$@"
