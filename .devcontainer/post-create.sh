#!/usr/bin/env bash
set -e
echo "==============================================="
echo "   🚀 FIXING ANDROID SDK + FLUTTER IN CODESPACES"
echo "==============================================="

sudo rm -rf /usr/local/android-sdk
sudo mkdir -p /usr/local/android-sdk
sudo chown -R vscode:vscode /usr/local/android-sdk

export ANDROID_SDK_ROOT=/usr/local/android-sdk

cd /usr/local/android-sdk
wget -q https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip -O tools.zip
sudo unzip -o tools.zip -d /usr/local/android-sdk/cmdline-tools-temp > /dev/null
rm tools.zip

sudo rm -rf /usr/local/android-sdk/cmdline-tools
sudo mkdir -p /usr/local/android-sdk/cmdline-tools/latest
sudo mv /usr/local/android-sdk/cmdline-tools-temp/* /usr/local/android-sdk/cmdline-tools/latest/
sudo rmdir /usr/local/android-sdk/cmdline-tools-temp

export PATH="$PATH:/usr/local/android-sdk/cmdline-tools/latest/cmdline-tools/bin"

if [ ! -f "/usr/local/android-sdk/cmdline-tools/latest/cmdline-tools/bin/sdkmanager" ]; then
    echo "❌ sdkmanager missing!"
    exit 1
fi

yes | sdkmanager --licenses
sdkmanager "platform-tools" "platforms;android-34" "build-tools;34.0.0"

flutter config --android-sdk /usr/local/android-sdk
sudo chown -R vscode:vscode /usr/local/flutter

flutter doctor -v || true

echo "==============================================="
echo "🎉 ANDROID SDK + FLUTTER SETUP COMPLETED"
echo "==============================================="
