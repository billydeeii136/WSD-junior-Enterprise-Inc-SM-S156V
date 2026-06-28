# Contacts Extraction Summary — SM-S156V (10.0.0.202)

**Device:** Samsung Galaxy A15 (SM-S156V)  
**ADB Serial:** adb-RZCYA00HSTF-DAxTvr._adb-tls-connect._tcp / 10.0.0.202:44327  
**Extraction Date:** 2026-06-28T15:32:52Z  
**Agent:** phone-agent (Oz)  

---

## Total Contacts Extracted

- **Raw Contacts:** 508 entries
- **Contacts (aggregated):** 409 entries
- **Groups:** 21 entries

---

## Data Breakdown by MimeType (from all_data_full.txt)

| MimeType | Count |
|----------|-------|
| vnd.android.cursor.item/group_membership | 423 |
| vnd.android.cursor.item/name | 416 |
| vnd.android.cursor.item/note | 415 |
| vnd.android.cursor.item/nickname | 415 |
| vnd.android.cursor.item/phone_v2 | 329 |
| vnd.android.cursor.item/email_v2 | 131 |
| vnd.android.cursor.item/identity | 38 |
| vnd.android.cursor.item/photo | 30 |
| vnd.sec.cursor.item/profile_card | 8 (Samsung-specific) |
| vnd.android.cursor.item/contact_event | 8 |
| vnd.android.cursor.item/organization | 6 |
| vnd.android.cursor.item/postal-address_v2 | 1 |

---

## Extraction Status by Content URI

| URI | Status | Lines | Notes |
|-----|--------|-------|-------|
| content://com.android.contacts/raw_contacts | SUCCESS | 508 | Full dump |
| content://com.android.contacts/data | SUCCESS | 4,034 | All data rows |
| content://com.android.contacts/contacts | SUCCESS | 409 | Aggregated contacts |
| content://com.android.contacts/groups | SUCCESS | 21 | Groups |
| content://com.android.contacts/data/phones | SUCCESS | 658 | Phone numbers |
| content://com.android.contacts/data/emails | SUCCESS | 262 | Email addresses |
| content://com.android.contacts/data/postal | FAILED | 10 | IllegalArgumentException |
| content://com.android.contacts/data/organizations | FAILED | 10 | IllegalArgumentException |
| content://com.android.contacts/data/events | FAILED | 10 | IllegalArgumentException |
| content://com.android.contacts/data/websites | FAILED | 10 | IllegalArgumentException |
| content://com.android.contacts/data/nickname | FAILED | 10 | IllegalArgumentException |
| content://com.android.contacts/data/notes | FAILED | 10 | IllegalArgumentException |
| content://com.android.contacts/data/im | FAILED | 10 | IllegalArgumentException |
| content://com.android.contacts/data/photo | FAILED | 10 | IllegalArgumentException |
| content://com.android.contacts/data/structured_name | FAILED | 10 | IllegalArgumentException |
| content://com.android.contacts/phone_lookup | FAILED | 10 | IllegalArgumentException |
| content://com.android.contacts/profile | SUCCESS | 1 | Empty (no user profile) |
| content://com.samsung.android.providers.contacts/* | FAILED | 6 | Provider not exported |
| content://com.android.providers.contacts/* | FAILED | 6 | Provider not exported |
| content://com.google.android.contacts/* | FAILED | — | Not accessible via shell |
| content://icc/adn | FAILED | 1 | SIM contacts not accessible |
| content://sim/adn | FAILED | 6 | SIM contacts not accessible |

---

## Fields Parsed from all_data (Success)

- **Postal addresses:** 1 entry extracted from all_data
- **Organizations:** 6 entries extracted from all_data
- **Events:** 8 entries extracted from all_data
- **Notes:** 415 entries extracted from all_data
- **Nicknames:** 415 entries extracted from all_data
- **Photos:** 30 entries extracted from all_data (metadata only, binary not pulled)
- **Structured names:** 416 entries extracted from all_data
- **Identity data:** 38 entries extracted from all_data
- **Group memberships:** 423 entries extracted from all_data
- **Samsung profile cards:** 8 entries extracted from all_data

---

## vCard Files

No vCard (.vcf) files found on internal storage or SD card.

---

## SIM Contacts

- `dumpsys telephony.registry` extracted (718 lines)
- Direct SIM content provider queries failed (SecurityException / no data)

---

## Missing / Not Available

- Actual contact photo binary data (blobs) — metadata extracted, images not downloaded
- vCard exports from device storage
- Direct SIM card contact list via content provider
- Google account contacts via separate provider (may be included in main contacts)
- Work profile contacts (if any) — shell user lacks permission for user 150

---

## Next Steps

- Extract contacts from 10.0.0.6 and 10.0.0.98 once wireless debugging is enabled
- Extract contacts from 10.0.0.5 once device is reachable on network
- Consider pulling photo binary data via `content://com.android.contacts/display_photo/<id>` URIs
- Consider triggering a system contacts vCard export via `am start` intent if user interaction is available

