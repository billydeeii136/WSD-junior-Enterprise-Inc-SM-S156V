# ADB Connection Status Report
Updated: 2026-06-29T14:32:15Z

## Connected Devices

| # | Device | Serial | USB | WiFi IP | WiFi Port | Status |
|---|--------|--------|-----|---------|-----------|--------|
| 1 | SM-S156V (Galaxy A15) | RZCYA00HSTF | CONNECTED (usb:20-2) | 10.0.0.152 | 5555 | ACTIVE |

## Disconnected Devices (Require Wireless Debugging)

| # | Device | MAC Address | Last Known IP | WiFi Port | Status | Action Needed |
|---|--------|-------------|---------------|-----------|--------|---------------|
| 2 | Samsung (unknown model) | 54:e0:19:bb:8d:6f | 10.0.0.6 | 5555/44327 | OFFLINE | Enable wireless debugging on device |
| 3 | Samsung (unknown model) | f8:25:51:0c:97:42 | 10.0.0.98 | 5555/44327 | OFFLINE | Enable wireless debugging on device |
| 4 | Samsung (unknown model) | 64:9a:63:27:31:ce | 10.0.0.5 | 5555/44327 | OFFLINE | Verify WiFi connection + enable debugging |
| 5 | Samsung (unknown model) | 64:9a:63:27:91:0e | 10.0.0.89 | 5555/44327 | OFFLINE | Verify WiFi connection + enable debugging |

## USB Scan Results

- Only 1 Samsung device detected on USB: RZCYA00HSTF (SM-S156V)
- Location ID: 0x14200000 / 8
- Speed: Up to 480 Mb/s
- No other Android/Samsung devices found on USB bus

## Notes

- Phone 1 IP changed from 10.0.0.202 to 10.0.0.152 (DHCP reassignment)
- Wireless debugging was disabled on Phone 1; re-enabled via USB using `adb tcpip 5555`
- Phones 2-5 require wireless debugging to be manually enabled on each device
- Phone auto-extract daemon (PID 5021) continues monitoring for new ADB connections

## To Connect Remaining Phones

On each remaining Samsung phone:
1. Settings → About phone → Tap Build Number 7 times
2. Settings → Developer options → Wireless debugging → ON
3. Settings → Developer options → Wireless debugging → Pair with pairing code
4. Report the IP:port and pairing code to this terminal
5. I will auto-pair and extract all data

