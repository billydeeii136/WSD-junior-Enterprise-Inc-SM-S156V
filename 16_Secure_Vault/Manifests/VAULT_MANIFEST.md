# SECURE VAULT MANIFEST - Samsung SM-S156V (WSD junior Enterprise Inc)
# CLASSIFICATION: SENSITIVE - RESTRICTED ACCESS
# Repository: billydeeii136/WSD-junior-Enterprise-Inc-SM-S156V
# Vault Path: 16_Secure_Vault/
# Created: 2026-06-28
# Extraction Method: ADB over Wi-Fi (10.0.0.202:44327)
# TOTAL SEPARATION - NO CONSOLIDATION - NO MERGING

================================================================================
VAULT SECURITY NOTICE
================================================================================
This vault contains sensitive personal, financial, health, and law enforcement
related documents extracted from the Samsung SM-S156V device. All files in
this vault are COPIES of the originals which remain in their original extracted
locations per the total separation requirement. No files were moved, deleted, or
modified from their original extracted positions.

================================================================================
VAULT CONTENTS INVENTORY
================================================================================

--- 16_Secure_Vault/Financial_Documents/Checks/ ---
Source: 07_Media_Photos/Checks/
Classification: FINANCIAL - SENSITIVE
Description: Check images captured via phone camera
Files Count: 2
File List:
  - .trashed-1782909411-20260601_003429.jpg (2,786,098 bytes)
  - .trashed-1782909411-20260601_003447.jpg (2,265,378 bytes)
Total Size: 5,051,476 bytes
Original Location: /sdcard/DCIM/Checks/
Risk Level: HIGH - Contains bank account numbers, routing numbers, signatures

--- 16_Secure_Vault/Identity_Documents/ID_Cards/ ---
Source: 07_Media_Photos/ID_Documents/
Classification: IDENTITY - RESTRICTED
Description: Personal identification documents captured via phone camera
Files Count: 14
File List:
  - .trashed-1782909411-20260601_003214.jpg (3,014,508 bytes)
  - .trashed-1782909410-20260601_000657.jpg (2,004,218 bytes)
  - .trashed-1782909411-20260601_002910.jpg (2,678,992 bytes)
  - .trashed-1782909410-20260601_000731.jpg (2,035,613 bytes)
  - .trashed-1782909411-20260601_003539.jpg (2,396,150 bytes)
  - .trashed-1782909411-20260601_002816.jpg (3,289,031 bytes)
  - .trashed-1782909411-20260601_003139.jpg (2,778,979 bytes)
  - .trashed-1782909410-20260601_000154.jpg (2,416,112 bytes)
  - .trashed-1782909411-20260601_003514.jpg (2,181,663 bytes)
  - .trashed-1782909411-20260601_003256.jpg (2,449,195 bytes)
  - .trashed-1782909411-20260601_002956.jpg (2,608,943 bytes)
  - .trashed-1782909411-20260601_000809.jpg (1,996,519 bytes)
  - .trashed-1782909410-20260601_000217.jpg (2,408,500 bytes)
  - .trashed-1782909411-20260601_002713.jpg (2,579,086 bytes)
Total Size: 35,837,509 bytes
Original Location: /sdcard/DCIM/I'D/
Risk Level: CRITICAL - Contains government-issued ID, SSN, driver's license,
            passport, or other identity documents. Access restricted.

--- 16_Secure_Vault/Health_Records/Humana_Insurance/ ---
Source: 07_Media_Photos/Humana_Health_Insurance/
Classification: HEALTH - HIPAA PROTECTED
Description: Humana health insurance documents captured via phone camera
Files Count: 2
File List:
  - .trashed-1782909411-20260601_000746.jpg (2,169,747 bytes)
  - .trashed-1782909411-20260601_000823.jpg (1,912,098 bytes)
Total Size: 4,081,845 bytes
Original Location: /sdcard/DCIM/Humana Health insurance/
Risk Level: HIGH - Contains health insurance information, member ID numbers,
            medical provider information. HIPAA protected.

--- 16_Secure_Vault/Law_Enforcement/PO_Officers/ ---
Source: 07_Media_Photos/PO_Officers/
Classification: LAW ENFORCEMENT - SENSITIVE
Description: Law enforcement related photographs captured via phone camera
Files Count: 1
File List:
  - .trashed-1782909411-20260601_005456.jpg (1,285,747 bytes)
Total Size: 1,285,747 bytes
Original Location: /sdcard/DCIM/PO Officers/
Risk Level: MEDIUM - Contains photographs of law enforcement officers or
            related documents. Context requires review.

--- 16_Secure_Vault/Email_Accounts/ ---
Source: 03_Email/
Classification: ACCOUNT CREDENTIALS - SENSITIVE
Description: Complete account dump from Android device showing all email
             accounts, authenticators, and sync services
Files Count: 1
File List:
  - all_accounts_full.txt (from dumpsys account)
Total Size: Variable (text dump)
Original Location: 03_Email/all_accounts_full.txt
Risk Level: CRITICAL - Contains email addresses, account types, and service
            mappings that could be used for credential targeting.

Email Accounts Cataloged:
  - billydeeii136@gmail.com (Gmail, Samsung, Yahoo Share)
  - williamscottdavisii136@gmail.com (Gmail)
  - williamscottdavis136@gmail.com (Gmail)
  - billydeeii136@yahoo.com (Yahoo Mail IMAP)
  - billydeeii@hotmail.com (Hotmail/Outlook IMAP, SkyDrive, Work Account)
  - williamscottdavis136@outlook.com (Outlook Work Account)
  - billydeeii136 (Yahoo username without domain)

Email Applications: Yahoo Mail, Microsoft Outlook, Gmail (system)
Email Providers: Google (Gmail), Yahoo, Microsoft (Hotmail/Outlook)

--- 16_Secure_Vault/Contact_Information/ ---
Source: 04_Contacts/
Classification: PERSONAL - SENSITIVE
Description: Phone contact information including phone numbers and email addresses
Files Count: 2
File List:
  - raw_contacts.txt (from content://com.android.contacts/raw_contacts)
  - phone_numbers.txt (from content://com.android.contacts/data/phones)
Total Size: Variable (text dumps)
Original Location: 04_Contacts/
Risk Level: HIGH - Contains personal contact information for individuals.

--- 16_Secure_Vault/WiFi_Credentials/ ---
Source: 13_WiFi_Networks/
Classification: NETWORK - SENSITIVE
Description: WiFi network configurations and saved network information
Files Count: 2
File List:
  - wifi_config.txt (from dumpsys wifi)
  - wifi_networks_list.txt (from dumpsys wifi grep)
Total Size: Variable (text dumps)
Original Location: 13_WiFi_Networks/
Risk Level: MEDIUM - Contains SSID names and network IDs. Passwords are
            encrypted and require root to extract. WiFi supplicant config
            (/data/misc/wifi/wpa_supplicant.conf) was not accessible without root.

================================================================================
VAULT ACCESS LOG
================================================================================
2026-06-28 14:00 UTC - Vault structure created by ADB extraction agent
2026-06-28 14:00 UTC - Sensitive files copied from original extraction locations
2026-06-28 14:00 UTC - Manifest generated and placed in 16_Secure_Vault/Manifests/

================================================================================
SECURITY RECOMMENDATIONS
================================================================================
1. The 16_Secure_Vault folder contains HIGH and CRITICAL risk data
2. Consider encrypting this folder before pushing to remote repositories
3. The ID_Documents folder contains what appears to be government-issued IDs
4. The Checks folder contains financial instrument images with account numbers
5. The Health_Records folder contains HIPAA-protected health insurance data
6. Email accounts should be secured with 2FA where not already enabled
7. WiFi passwords should be rotated if network security is compromised
8. All files are marked as .trashed-[number] indicating they were in phone's
   trash/recycle bin but still physically present on storage

================================================================================
VERIFICATION
================================================================================
All files in this vault are VERIFIED COPIES of the original extraction.
No modifications were made to any file content.
Original timestamps preserved via cp -p (preserve mode).
Original files remain in their extracted locations per total separation rule.

Total Vault Files: 23 (19 image files + 4 text data files)
Total Vault Size: ~46,255,577 bytes (~44.1 MB)

================================================================================
END OF SECURE VAULT MANIFEST
================================================================================
