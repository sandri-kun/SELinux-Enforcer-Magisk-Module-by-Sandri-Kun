# Changelog
All notable changes to the **SELinux Enforcer & Cleaner** module will be documented in this file.

## [v2.0] - 2026-02-13
### Added
- **Auto-Update System:** Added script logic to automatically check for updates from GitHub on boot.
- **Internet Check:** Script now verifies internet connection (pings google.com) before attempting to download updates to save resources.
- **LSPosed Log Wiper:** Added specific cleaner for `LSPosed_crash_report*.zip` in `/sdcard/Documents/`.

### Changed
- Increased boot delay buffer to `30s` to ensure system properties are stable before spoofing.
- Improved `resetprop` execution order for better `ro.build.selinux` spoofing.
- Updated `module.prop` description with better SEO keywords for Rootbeer Fresh & Banking Apps.

---

## [v1.5] - 2026-02-10
### Added
- **Deep Cleaning:** Added support for deleting `/sdcard/Fox` (OrangeFox Recovery) folders.
- **Safety Check:** Added verification logic to ensure the kernel is actually Enforcing after execution.

### Fixed
- Fixed an issue where the script might run before `sys.boot_completed`, causing the cleaner to miss some mounted folders.

---

## [v1.0] - 2026-02-01
### Initial Release
- **SELinux Enforcer:** Force kernel to Enforcing mode (`setenforce 1`).
- **Property Spoofing:** Set `ro.build.selinux` to `1` and `ro.debuggable` to `0`.
- **Basic Cleaner:** Automatically removes `/sdcard/TWRP` and `/sdcard/Magisk` directories.
- **Logging:** Basic log output to `/sdcard/SELinux_Enforcer.log` for debugging.