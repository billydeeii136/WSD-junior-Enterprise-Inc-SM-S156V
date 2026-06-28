# Audit Baseline Report - Samsung SM-S156V (Galaxy A15)
# Device Name: WSD junior Enterprise Inc
# Serial: RZCYA00HSTF
# Android Version: 16
# Build: BP2A.250605.031.A3.S156VUDSBDZDC
# Extraction Date: 2026-06-28
# Extracted By: ADB over Wi-Fi (10.0.0.202:44327)
# Repository: billydeeii136/WSD-junior-Enterprise-Inc-SM-S156V
# TOTAL SEPARATION - NO CONSOLIDATION - NO MERGING

================================================================================
SECTION 1: DEVICE IDENTIFICATION
================================================================================
Model: Samsung SM-S156V (Galaxy A15)
Manufacturer: samsung
Serial Number: RZCYA00HSTF
Device Name: WSD junior Enterprise Inc
Bluetooth Name: WSD junior Enterprise Inc
Android Version: 16
Build Display ID: BP2A.250605.031.A3.S156VUDSBDZDC
Product: a15xtfn
Device Codename: a15x

================================================================================
SECTION 2: EMAIL ACCOUNTS (CRITICAL - HIGH PRIORITY)
================================================================================
The following email accounts were discovered on the device:

Gmail Accounts (com.google):
- billydeeii136@gmail.com
- williamscottdavisii136@gmail.com
- williamscottdavis136@gmail.com

Samsung Account (com.osp.app.signin):
- billydeeii136@gmail.com

Yahoo Account (com.yahoo.mobile.client.share.account):
- billydeeii136@gmail.com
- billydeeii136 (username without domain)

Yahoo Mail IMAP (com.google.android.gm.legacyimap):
- billydeeii136@yahoo.com

Hotmail/Outlook IMAP (com.google.android.gm.legacyimap):
- billydeeii@hotmail.com

Microsoft Work Accounts (com.microsoft.workaccount):
- billydeeii@hotmail.com
- williamscottdavis136@outlook.com

Microsoft SkyDrive (OneDrive):
- billydeeii@hotmail.com

Email Applications Installed:
- com.yahoo.mobile.client.android.mail (Yahoo Mail)
- com.microsoft.office.outlook (Microsoft Outlook)
- com.google.android.gm (Gmail - system app with IMAP support)

Email Apps - Active Sync/Authenticator Services:
- com.yahoo.mobile.client.android.mail (Yahoo authenticator)
- com.google.android.gm (Exchange, POP3, Legacy IMAP authenticators)
- com.microsoft.office.outlook (Outlook authenticator)

================================================================================
SECTION 3: INSTALLED APPLICATIONS (User-Installed)
================================================================================
Key user-installed applications identified:
- ai.x.grok (Grok AI)
- co.crystalapp.crystal (Crystal app)
- com.onefinance.one (One Finance)
- com.walmart.android (Walmart)
- com.xodo.pdf.reader (Xodo PDF Reader)
- com.yahoo.mobile.client.android.mail (Yahoo Mail)
- com.microsoft.office.outlook (Microsoft Outlook)
- com.microsoft.office.word (Microsoft Word)
- com.microsoft.emmx (Microsoft Edge)
- com.android.chrome (Google Chrome)
- org.mozilla.firefox (Mozilla Firefox)
- com.sec.android.app.sbrowser (Samsung Browser)
- com.whatsapp (WhatsApp)
- com.facebook.appmanager (Facebook)
- com.instagram.lite (Instagram Lite)
- com.wuliang.xapkinstaller (XAPK Installer)

Full package list stored in: 02_Apps_Installed/all_packages.txt

================================================================================
SECTION 4: FILE EXTRACTION SUMMARY
================================================================================
Category                          Files Extracted
--------------------------------  ---------------
07_Media_Photos (DCIM)            185 files
  - Camera                        8 files
  - Checks                        2 files
  - Facebook                      1 file
  - Family                        28 files
  - Family 1                      25 files
  - Galaxy Avatar                 1 file
  - Humana Health Insurance       2 files
  - ID Documents                  14 files
  - PO Officers                   1 file
  - Screenshots                   47 files
  - Pictures (external)           28 files

08_Media_Videos (Movies)          3 files

09_Media_Audio (Music)            2 files

10_Media_Downloads                1 file
  - stale_wifi_backup_20260614.txt

11_Documents                      0 files (empty)
  - Jacqueline Francois Davis folder (empty)
  - SSA 1099 folder (empty)
  - Credit Reports folder (empty)

12_App_Configs (Android System)   1,898 files

03_Email                          9 files
  - all_accounts.txt (initial dump)
  - all_accounts_full.txt (complete dump)
  - yahoo_mail_app_info.txt
  - outlook_app_info.txt
  - yahoo_mail_file_list.txt
  - outlook_file_list.txt
  - contacts_email_addresses.txt
  - Outlook_External_Data (2 files)

04_Contacts                       2 files
  - raw_contacts.txt
  - phone_numbers.txt

05_Call_Logs                      1 file
  - call_logs.txt

06_SMS_MMS                        2 files
  - sms_messages.txt
  - mms_messages.txt

13_WiFi_Networks                  2 files
  - wifi_config.txt
  - wifi_networks_list.txt

14_Browser_Data                   2 files (directories created)
  - Chrome_Data (empty)
  - Firefox_Data (empty)

01_Device_Info                    5 files
  - device_properties.txt
  - battery_info.txt
  - cpu_info.txt
  - memory_info.txt
  - storage_info.txt

17_Full_Filesystem_Tree           1 file
  - sdcard_full_tree.txt (0 files - sdcard externally scanned)

18_Audit_Report                   1 file
  - full_file_inventory.txt

TOTAL FILES EXTRACTED: ~2,112 files

================================================================================
SECTION 5: SENSITIVE DATA IDENTIFIED FOR VAULT
================================================================================
- Email account credentials and addresses (multiple providers)
- WiFi network configurations (attempted root access failed)
- Phone numbers and contact information
- Personal ID documents (I'D folder in DCIM)
- Health insurance documents (Humana folder)
- Financial documents (Checks folder)
- Family photos and personal screenshots
- SSA 1099 folder (empty but named for tax documents)
- Jacqueline Francois Davis folder (empty but named for personal records)
- PO Officers folder (potentially law enforcement related)
- Credit Reports folder (empty but named for financial data)

================================================================================
SECTION 6: EXTRACTION NOTES
================================================================================
- Phone connected via ADB over Wi-Fi (10.0.0.202:44327)
- USB data connection failed (cable charge-only or port issue)
- Wireless debugging enabled successfully
- Root access not available - internal /data/data/ app contents not fully accessible
- External storage (/sdcard) fully extracted
- Some folders (Documents, Jacqueline Francois Davis, SSA 1099, Credit Reports) were empty on external storage
- App data in internal storage requires root to access
- All files extracted with original timestamps preserved via ADB pull
- Total separation maintained - no consolidation or merging of any data

================================================================================
SECTION 7: NEXT STEPS REQUIRED
================================================================================
1. Email access: Email messages are stored in app internal databases
   - Requires opening Yahoo Mail and Outlook apps to export emails
   - Or root access to pull /data/data/ app databases
2. Google Drive mirror: Upload extracted data to Google Drive
3. Vault security: Review sensitive data in 16_Secure_Vault folder
4. Second phone: Connect wife's Samsung Galaxy A17 when available
5. Full root extraction: If possible, root the device to pull internal databases

================================================================================
END OF AUDIT BASELINE REPORT
================================================================================
