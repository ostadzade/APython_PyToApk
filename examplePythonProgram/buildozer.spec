[app]

# عنوان برنامه
title = My Application

# نام پکیج (معمولاً به شکل com.example.myapp)
package.name = myapp

# دامنه پکیج (معمولاً com.example)
package.domain = org.test

# نسخه کد (عدد صحیح)
version.code = 1

# نسخه نام (رشته)
version.release = 0.1

# فایل اصلی برنامه
source.include_exts = py,png,jpg,kv,atlas
source.include_patterns = assets/*,images/*

# وابستگی‌های پایتون
requirements = kivy

# پلتفرم هدف
android.api = 31
android.minapi = 21
android.ndk = 23.1.7779620
[app]
android.sdk_path = /home/runner/.buildozer/android/platform/android-sdk
android.ndk_path = /home/runner/.buildozer/android/platform/android-ndk
