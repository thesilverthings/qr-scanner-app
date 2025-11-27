FROM mcr.microsoft.com/devcontainers/base:jammy

# Basic deps
RUN apt-get update && apt-get install -y \
    curl unzip xz-utils zip git wget ca-certificates \
    libglu1-mesa clang cmake ninja-build pkg-config \
    openjdk-17-jdk     && apt-get clean

# --------------------------------------------
# INSTALL ANDROID SDK (command line tools)
# --------------------------------------------
RUN mkdir -p /usr/local/android-sdk \
    && cd /usr/local/android-sdk \
    && wget https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip -O cmdline-tools.zip \
    && unzip cmdline-tools.zip -d cmdline-tools \
    && rm cmdline-tools.zip

RUN mkdir -p /usr/local/android-sdk/cmdline-tools/latest \
    && mv /usr/local/android-sdk/cmdline-tools/* /usr/local/android-sdk/cmdline-tools/latest

ENV ANDROID_SDK_ROOT="/usr/local/android-sdk"
ENV PATH="$PATH:/usr/local/android-sdk/cmdline-tools/latest/bin:/usr/local/android-sdk/platform-tools"

# --------------------------------------------
# INSTALL FLUTTER
# --------------------------------------------
RUN git clone https://github.com/flutter/flutter.git -b stable /usr/local/flutter
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Non-root vscode user setup handled by Codespaces environment.
