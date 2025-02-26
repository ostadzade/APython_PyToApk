FROM ubuntu:20.04

# تنظیم منطقه زمانی به‌صورت پیش‌فرض
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC

# نصب وابستگی‌های لازم
RUN apt-get update && \
    apt-get install -y \
        python3 \
        python3-pip \
        git \
        zip \
        unzip \
        openjdk-17-jdk \
        wget \
        tzdata && \  # نصب بسته tzdata
    rm -rf /var/lib/apt/lists/*  # حذف فایل‌های موقت apt

# نصب Buildozer
RUN pip3 install --upgrade Cython buildozer

# تنظیم محیط Android SDK
ENV ANDROID_HOME /android-sdk
RUN mkdir -p $ANDROID_HOME/cmdline-tools && \
    wget https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip -O cmdline-tools.zip && \
    unzip cmdline-tools.zip -d $ANDROID_HOME/cmdline-tools/ && \
    mkdir -p $ANDROID_HOME/cmdline-tools/latest && \
    mv $ANDROID_HOME/cmdline-tools/cmdline-tools/* $ANDROID_HOME/cmdline-tools/latest/ && \
    rm cmdline-tools.zip

# اضافه کردن Android SDK به PATH
ENV PATH $ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$PATH

# پذیرش لیسانس‌های Android SDK
RUN yes | $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager --licenses

# تنظیم مسیر کاری
WORKDIR /app
