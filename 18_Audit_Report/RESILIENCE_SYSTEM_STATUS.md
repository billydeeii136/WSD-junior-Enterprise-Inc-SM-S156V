# WSD_CCOS RESILIENCE SYSTEM — STATUS REPORT
# Created: 2026-06-28
# Survives: power outages, crashes, reboots, lost connections, phone restarts

================================================================================
RESILIENCE SYSTEM COMPONENTS
================================================================================

1. RESILIENCE DAEMON (com.wsd.resilience-daemon)
   - Path: /Users/chip/.wsd_resilience/scripts/wsd_resilience_daemon.sh
   - Launchd: ~/Library/LaunchAgents/com.wsd.resilience-daemon.plist
   - PIDs: 4507 (launchd), 4538 (nohup backup)
   - Status: RUNNING ✅
   - Functions:
     * Auto-sync to GitHub every 60 seconds
     * Auto-sync to GitLab (when configured)
     * Auto-sync to Google Drive (when rclone OAuth complete)
     * Health monitoring every 30 seconds
     * ADB auto-reconnect every 30 seconds
     * Retry queue for failed syncs (re-attempts every 5 minutes)
     * System recovery after reboot/crash
     * Terminal log capture

2. PHONE AUTO-EXTRACTION COMPANION (com.wsd.phone-auto-extract)
   - Path: /Users/chip/.wsd_resilience/scripts/wsd_phone_auto_extract.sh
   - Launchd: ~/Library/LaunchAgents/com.wsd.phone-auto-extract.plist
   - PIDs: 3993 (launchd), 5021 (nohup backup)
   - Status: RUNNING ✅
   - Functions:
     * Monitors ADB connections every 30 seconds
     * Auto-extracts contacts when phones reconnect after reboot
     * Tracks which phones have been extracted (avoids duplicates)
     * Commits and pushes to GitHub automatically
     * Detects new devices not in config

3. TERMINAL AUTO-LOGGING
   - Path: ~/.zshrc (added to end of file)
   - Status: CONFIGURED ✅
   - Functions:
     * Every new terminal session is automatically logged
     * Logs written to: /Users/chip/phone_inventory/18_Audit_Report/terminal_logs/
     * Background sync every 60 seconds commits to GitHub
     * Metadata file created for each session
     * Survives session crashes and terminal restarts

4. LAUNCHD AUTO-START SERVICES
   - Status: INSTALLED & LOADED ✅
   - Services:
     * com.wsd.resilience-daemon — starts on boot, restarts if crashed
     * com.wsd.phone-auto-extract — starts on boot, restarts if crashed
   - Location: ~/Library/LaunchAgents/
   - KeepAlive: true (auto-restart on crash or exit)

================================================================================
WHAT HAPPENS DURING DIFFERENT FAILURE SCENARIOS
================================================================================

SCENARIO 1: POWER OUTAGE
- Mac shuts down
- Resilience daemon stops
- Phone(s) may disconnect or restart
- When power returns:
  * Mac boots automatically
  * Launchd starts resilience daemon (com.wsd.resilience-daemon)
  * Launchd starts phone auto-extract (com.wsd.phone-auto-extract)
  * Daemon detects downtime via last_run.timestamp
  * Daemon performs system recovery:
    - Reconnects ADB to phones
    - Processes retry queue for failed syncs
    - Commits any accumulated changes
    - Pushes to GitHub when internet available
  * Phone auto-extract detects reconnected phones
  * Auto-extracts contacts if phone was restarted (new data)
  * All data preserved in local git repo even if offline

SCENARIO 2: INTERNET GOES DOWN
- GitHub push fails
- Daemon detects failure and queues sync in retry queue
- Local git commits continue every 60 seconds
- All changes stored in local git repo
- When internet returns:
  * Daemon detects connectivity via ping 8.8.8.8
  * Processes retry queue (re-attempts failed syncs)
  * Pushes all queued commits to GitHub
  * Syncs to Google Drive via rclone

SCENARIO 3: PHONE RESTARTS / CRASHES
- ADB connection drops
- Phone auto-extract detects disconnection
- When phone reconnects to WiFi:
  * Resilience daemon's ADB reconnect check attempts to reconnect
  * If phone has wireless debugging enabled, ADB reconnects automatically
  * Phone auto-extract detects reconnection
  * If phone was restarted (new data), auto-extracts contacts
  * Commits and pushes to GitHub

SCENARIO 4: Mac REBOOTS / CRASHES
- All processes stop
- Terminal sessions end
- When Mac reboots:
  * Launchd auto-starts resilience daemon
  * Launchd auto-starts phone auto-extract
  * Daemon reads last_run.timestamp, detects downtime
  * Performs system recovery
  * New terminal sessions auto-log via ~/.zshrc
  * All data from previous sessions preserved in git repo

SCENARIO 5: GITHUB IS DOWN
- Push fails
- Daemon queues sync in retry queue
- Local git commits continue
- When GitHub returns:
  * Retry queue processes failed syncs
  * All queued commits pushed
  * If GitLab configured, syncs to GitLab as backup

SCENARIO 6: GOOGLE DRIVE SYNC FAILS
- rclone sync fails
- Daemon queues sync in retry queue
- Local data preserved
- When rclone/Google Drive available:
  * Retry queue processes failed syncs
  * All data synced to Google Drive

================================================================================
FAULT TOLERANCE FEATURES
================================================================================

- Multiple sync paths: GitHub (primary), GitLab (secondary), Google Drive (tertiary)
- Local git repo as queue: All changes committed locally even if offline
- Retry queue: Failed syncs automatically retried every 5 minutes
- Health monitoring: Internet, GitHub, GitLab, Google Drive, ADB devices monitored
- ADB auto-reconnect: Attempts to reconnect to phones every 30 seconds
- System recovery: Full recovery after reboot/crash
- Terminal logging: Every session captured and synced
- Launchd KeepAlive: Services auto-restart on crash
- Dual process strategy: Both launchd and nohup processes running (redundancy)

================================================================================
PHONE CONFIGURATION FILE
================================================================================

Location: /Users/chip/.wsd_resilience/state/phone_configs.txt
Format: IP:PORT:DEVICE_NAME:GITHUB_REPO

Current entries:
- 10.0.0.202:44327:SM-S156V:WSD-junior-Enterprise-Inc-SM-S156V

To add new phones:
1. Enable wireless debugging on the phone
2. Connect via ADB
3. Add a line to phone_configs.txt:
   IP:PORT:DEVICE_NAME:GITHUB_REPO

================================================================================
DIRECTORY STRUCTURE
================================================================================

/Users/chip/.wsd_resilience/
├── launchd/
│   ├── com.wsd.resilience-daemon.plist      (auto-start daemon)
│   └── com.wsd.phone-auto-extract.plist     (auto-start phone monitor)
├── logs/
│   ├── daemon.log                           (daemon activity log)
│   ├── daemon.nohup.log                     (backup daemon log)
│   ├── phone_auto.log                       (phone monitor log)
│   ├── phone_auto.nohup.log               (backup phone monitor log)
│   ├── launchd.stdout.log                   (launchd stdout)
│   └── launchd.stderr.log                   (launchd stderr)
├── scripts/
│   ├── wsd_resilience_daemon.sh             (main daemon)
│   └── wsd_phone_auto_extract.sh            (phone monitor)
├── state/
│   ├── phone_configs.txt                    (phone configurations)
│   ├── health_status.json                   (last health check)
│   ├── last_run.timestamp                   (last daemon run)
│   ├── heartbeat.timestamp                  (last heartbeat)
│   └── daemon.pid                           (current daemon PID)
└── queue/
    └── failed_syncs.log                     (failed sync queue)

================================================================================
GIT REPOSITORIES (Real-Time Sync Targets)
================================================================================

GitHub (Primary): billydeeii136/WSD-junior-Enterprise-Inc-SM-S156V
GitHub (Contacts): billydeeii136/WSD-junior-Enterprise-Inc-Contacts-Inventory
GitLab (Secondary): NOT YET CONFIGURED
Google Drive (Tertiary): NOT YET CONFIGURED (needs rclone OAuth)

================================================================================
STATUS SUMMARY
================================================================================

Component                          Status
---------------------------------  --------
Resilience Daemon (launchd)        ✅ RUNNING (PID 4507)
Resilience Daemon (nohup)          ✅ RUNNING (PID 4538)
Phone Auto-Extract (launchd)       ✅ RUNNING (PID 3993)
Phone Auto-Extract (nohup)         ✅ RUNNING (PID 5021)
Terminal Auto-Logging (.zshrc)     ✅ CONFIGURED
Launchd Services                   ✅ INSTALLED & LOADED
GitHub Sync                        ✅ WORKING
GitLab Sync                        ⚠️ NOT CONFIGURED
Google Drive Sync                  ⚠️ NOT CONFIGURED (needs OAuth)
ADB Phone 1 (10.0.0.202)           ✅ CONNECTED
ADB Phone 2 (10.0.0.6)             ❌ WAITING (needs wireless debugging)
ADB Phone 3 (10.0.0.98)            ❌ WAITING (needs wireless debugging)
ADB Phone 4 (10.0.0.5)             ❌ NOT REACHABLE (needs WiFi check)
ADB Phone 5 (10.0.0.89)            ❌ NOT REACHABLE (needs WiFi check)

================================================================================
WHAT TO DO WHEN THINGS GO WRONG
================================================================================

If resilience daemon stops:
  launchctl start com.wsd.resilience-daemon
  OR: nohup /Users/chip/.wsd_resilience/scripts/wsd_resilience_daemon.sh &

If phone auto-extract stops:
  launchctl start com.wsd.phone-auto-extract
  OR: nohup /Users/chip/.wsd_resilience/scripts/wsd_phone_auto_extract.sh &

If GitHub sync fails:
  Check internet: ping 8.8.8.8
  Check gh auth: gh auth status
  Retry queue processes automatically after 5 minutes

If phone disconnects and doesn't reconnect:
  Check phone is on WiFi (Tony network)
  Check wireless debugging is still enabled
  Restart phone if needed
  Re-enable wireless debugging if it was turned off

If Mac crashes and doesn't auto-start:
  Check launchd: launchctl list | grep com.wsd
  Reload if needed: launchctl load ~/Library/LaunchAgents/com.wsd.resilience-daemon.plist

================================================================================
END OF STATUS REPORT
================================================================================
