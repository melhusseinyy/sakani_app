@echo off
echo 🧹 Starting Flutter & Gradle cleanup...

REM احذف كاش Gradle من الجهاز
echo 🔄 Removing global Gradle cache...
rmdir /s /q %USERPROFILE%\.gradle\caches

REM احذف مجلد .gradle من المشروع نفسه
echo 🔄 Removing local .gradle folder...
rmdir /s /q .gradle

REM تنظيف المشروع باستخدام Flutter
echo 🧽 Running flutter clean...
flutter clean

REM إعادة تحميل الباكيجات
echo ⬇️ Running flutter pub get...
flutter pub get

echo ✅ Cleanup completed! Now run: flutter run
pause
