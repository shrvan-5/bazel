FROM ubuntu:20.04
WORKDIR /usr/src/app
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    build-essential \
    unzip
RUN curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor >bazel-archive-keyring.gpg \
    && mv bazel-archive-keyring.gpg /usr/share/keyrings \
    && echo "deb [signed-by=/usr/share/keyrings/bazel-archive-keyring.gpg] https://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list \
    && apt-get update && apt-get install -y bazel \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
COPY . .
CMD ["bazel", "build", "//:main"]
