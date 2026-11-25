#!/usr/bin/env bash
# Device smoke test on a running Android emulator (see device-smoke.yml).
set -u
NAME="${1:-device}"
mkdir -p smoke
PKG=$(grep -hm1 'applicationId' android/app/build.gradle* | sed -E 's/.*"([^"]+)".*/\1/')
echo "package: $PKG"
# A hung adb/emulator step fails fast with diagnostics instead of hitting the
# 50-minute job timeout.
hang() {
  echo "::error::smoke step timed out: $1"
  timeout 30 adb shell pidof "$PKG" || echo "app process not running"
  timeout 30 adb shell dumpsys activity top | head -40 || true
  timeout 60 adb logcat -d > "smoke/$NAME-logcat.txt" || true
  grep -E "FATAL|ANR|$PKG" "smoke/$NAME-logcat.txt" | tail -80 || true
  exit 1
}
adb install -r build/app/outputs/flutter-apk/app-release.apk || exit 1
adb logcat -c
timeout 60 adb shell monkey -p "$PKG" -c android.intent.category.LAUNCHER 1 || hang "launch"
sleep 25
timeout 90 adb exec-out screencap -p > "smoke/$NAME-start.png" || hang "screencap (start)"
# ~500 random taps/swipes inside the app (fixed seed = reproducible).
timeout 300 adb shell monkey -p "$PKG" --pct-touch 75 --pct-motion 20 --pct-nav 0 --pct-majornav 5 \
  --throttle 120 -s 42 500 > "smoke/$NAME-monkey.txt" 2>&1 || hang "monkey"
sleep 3
timeout 90 adb exec-out screencap -p > "smoke/$NAME-after.png" || hang "screencap (after)"
timeout 60 adb logcat -d > "smoke/$NAME-logcat.txt"
if grep -E "FATAL EXCEPTION|ANR in $PKG|// CRASH" "smoke/$NAME-logcat.txt" "smoke/$NAME-monkey.txt"; then
  echo "Crash or ANR detected"
  grep -A40 "FATAL EXCEPTION" "smoke/$NAME-logcat.txt" | head -120 || true
  grep -A40 "// CRASH" "smoke/$NAME-monkey.txt" | head -60 || true
  exit 1
fi
if ! adb shell pidof "$PKG" > /dev/null; then
  echo "App process is not running"; exit 1
fi
echo "Android smoke test passed on $NAME"
