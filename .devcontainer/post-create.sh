#!/usr/bin/env bash
set -euo pipefail
export PATH="/usr/local/flutter/bin:$PATH"
export ANDROID_SDK_ROOT=/usr/local/android-sdk
export PATH="$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools:$PATH"

echo "Running flutter doctor and installing android sdk components..."

# Accept licenses and install SDK components
yes | sdkmanager --sdk_root=${ANDROID_SDK_ROOT} --licenses || true
sdkmanager --sdk_root=${ANDROID_SDK_ROOT} "platform-tools" "platforms;android-33" "build-tools;33.0.2" "emulator" "cmdline-tools;latest" || true

# Accept android licenses for flutter
yes | flutter doctor --android-licenses || true

# Run doctor
flutter doctor -v || true

echo "Post-create setup complete."
