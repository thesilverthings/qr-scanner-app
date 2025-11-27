#!/usr/bin/env bash
set -e
echo "🔧 Installing Android SDK packages..."
yes | sdkmanager --licenses || true

# Install platform tools, platform and build tools
sdkmanager "platform-tools" "platforms;android-34" "build-tools;34.0.0" "cmdline-tools;latest" || true

# Install additional linux dev tools if missing
apt-get update
apt-get install -y clang cmake ninja-build pkg-config || true

echo "🔧 Running flutter doctor..."
flutter doctor -v || true

echo "🎉 .devcontainer post-create actions complete!"
