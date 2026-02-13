#!/system/bin/sh

# --- KONFIGURASI ---
ENABLE_LOG=true
LOG_FILE="/sdcard/SELinux_Enforcer.log"

# Fungsi pencatat log
log_msg() {
  if [ "$ENABLE_LOG" = "true" ]; then
    echo "$1" >> "$LOG_FILE"
  fi
}

# Tunggu sampai boot selesai
while [ "$(getprop sys.boot_completed)" != "1" ]; do
  sleep 1
done

# Buffer tambahan
sleep 5

# -- START LOGGING --
if [ "$ENABLE_LOG" = "true" ]; then
  echo "--- SELinux Enforcer & Cleaner Log ---" > "$LOG_FILE"
  echo "Date: $(date)" >> "$LOG_FILE"
fi

# --- EXECUTE FIX (SELinux) ---
log_msg "[EXEC] Applying SELinux fix..."

# 1. Paksa Kernel jadi Enforcing
setenforce 1

# 2. Palsukan properti
resetprop ro.build.selinux 1
resetprop ro.boot.selinux 1
resetprop ro.debuggable 0

# --- EXECUTE CLEANUP (FOLDERS) ---
# Menghapus folder TWRP, Fox, dan Magisk
TARGET_FOLDERS="/storage/emulated/0/TWRP /storage/emulated/0/Fox /storage/emulated/0/Magisk"

log_msg "[CLEAN] Starting folder cleanup..."
for DIR in $TARGET_FOLDERS; do
  if [ -d "$DIR" ]; then
    rm -rf "$DIR"
    log_msg "[CLEAN] Deleted folder: $DIR"
  fi
done

# --- EXECUTE CLEANUP (FILES) ---
# Menghapus file acak LSPosed Crash Report di Documents
# Pola: LSPosed_crash_report*.zip (tanda * akan mencocokkan angka acak apa saja)
TARGET_FILES="/storage/emulated/0/Documents/LSPosed_crash_report*.zip"

# Cek apakah file ada sebelum menghapus untuk menghindari error di log
if ls $TARGET_FILES 1> /dev/null 2>&1; then
  rm -f $TARGET_FILES
  log_msg "[CLEAN] Deleted LSPosed crash reports."
else
  log_msg "[CLEAN] No LSPosed crash reports found."
fi

# --- FINAL VERIFICATION ---
STATUS_KERNEL_FINAL=$(getenforce)
STATUS_PROP_FINAL=$(getprop ro.build.selinux)

if [ "$STATUS_KERNEL_FINAL" = "Enforcing" ] && [ "$STATUS_PROP_FINAL" = "1" ]; then
  log_msg "[RESULT] SUCCESS: System is fully Enforcing."
else
  log_msg "[RESULT] WARNING: Mismatch detected."
fi
