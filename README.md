# SELinux Enforcer & Trace Cleaner (Magisk Module) by SAndri Kun

## 🚀 Description
This module is a strictly designed tool to **Fix SELinux Flag is Enabled** issues detected by security apps like **Rootbeer Fresh**, **Momo**, and various Banking Apps. It ensures your device appears as "Official" and secure by forcing SELinux Enforcing mode and wiping common root traces from your internal storage.

## 🔑 Key Features
* **Force SELinux Enforcing:** Automatically executes `setenforce 1` on boot.
* **Spoof System Properties:** Uses `resetprop` to fake `ro.build.selinux` status to `1` (Enforcing).
* **Deep Cleaning:** Automatically deletes **TWRP**, **Fox**, and **Magisk** folders from `/sdcard/` that trigger detection.
* **Log Wiper:** Removes **LSPosed crash reports** (`.zip`) from Documents to prevent detection by sensitive apps.

## 🛠️ Solves Detection For:
* **Rootbeer Fresh:** Fixes "SELinux Flag is Enabled" red cross.
* **Momo Detection:** Helps reduce suspicious environment alerts.
* **Banking Apps:** Bypasses basic root detection caused by permissive SELinux or leftover storage folders.
* **Games:** Anti-cheat engines that scan for `TWRP` folders or `Magisk` remnants.

## 📝 How it Works
Upon boot, the script waits for the system to initialize, then:
1.  Checks current SELinux status.
2.  Forces **Enforcing** mode.
3.  Injects safe system props (`ro.boot.selinux`, `ro.debuggable`).
4.  Silently removes directory paths: `/sdcard/TWRP`, `/sdcard/Fox`, `/sdcard/Magisk`.

## 💖 Support This Project
If you find this module helpful, consider making a donation to support future development:

| Network | Wallet Address |
|---------|----------------|
| **BSC / BEP20** | `0xbe6f4b04dbcd42b47e75c4fd7f208fb3062c86f5` |

Your support is greatly appreciated! 🙏

## 🏷️ Tags / Keywords
SELinux Enforcing, Hide Root, Magisk Hide, Rootbeer Fresh Pass, Fix SELinux Flag, Bypass Banking App, Remove TWRP Folder, Delete Magisk Folder, Anti-Detection, Zygisk, Shamiko Alternative, Play Integrity Fix, Hide Developer Options, LSPosed Cleaner.