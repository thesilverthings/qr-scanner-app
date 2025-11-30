FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu

# Install essentials
RUN apt-get update && apt-get install -y curl unzip git wget xz-utils openjdk-11-jdk

# Install Flutter (stable)
ENV FLUTTER_HOME=/usr/local/flutter
RUN git clone https://github.com/flutter/flutter.git -b stable $FLUTTER_HOME
ENV PATH="$FLUTTER_HOME/bin:$PATH"

# Android SDK root
ENV ANDROID_SDK_ROOT=/usr/local/android-sdk
RUN mkdir -p ${ANDROID_SDK_ROOT}

# Download command line tools
RUN mkdir -p /tmp/sdk && cd /tmp/sdk && \
    curl -o cmdline-tools.zip https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip && \
    unzip cmdline-tools.zip -d ${ANDROID_SDK_ROOT} && rm cmdline-tools.zip

# Arrange expected layout
RUN mkdir -p ${ANDROID_SDK_ROOT}/cmdline-tools && mv ${ANDROID_SDK_ROOT}/tools ${ANDROID_SDK_ROOT}/cmdline-tools/latest || true

ENV PATH="${ANDROID_SDK_ROOT}/cmdline-tools/latest/bin:${ANDROID_SDK_ROOT}/platform-tools:${PATH}"
