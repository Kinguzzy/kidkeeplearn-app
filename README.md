# KidKeep Learn Mobile v1

This package wraps the KidKeep Learn V107 web application into native Android and iOS shells while preserving the same HTML/JavaScript feature set and data behavior.

## Included
- `android/` — Android Studio/Gradle project, application ID `com.kidkeeplearn.app`.
- `ios/` — iOS Swift/WKWebView source with an XcodeGen `project.yml`.
- `shared/www/` — the mobile-adjusted KidKeep Learn web assets.
- `.github/workflows/build-android-apk.yml` — optional cloud workflow that creates a test APK.

## Android test APK
This environment did not include an Android SDK, so the APK cannot be compiled locally here. The Android project is build-ready. To create the APK:

### Android Studio
1. Open the `android` folder in Android Studio.
2. Let Gradle sync.
3. Build > Build APK(s).
4. Install `app/build/outputs/apk/debug/app-debug.apk` on your Android phone.

### GitHub Actions
1. Upload this package to a GitHub repository.
2. Open the Actions tab.
3. Run **Build Android APK**.
4. Download the `KidKeepLearn-debug-apk` artifact.

## Google Play
For Play Store release, increment `versionCode`/`versionName`, create a release signing key, build an Android App Bundle (`bundleRelease`), complete the Play Console privacy/data-safety declarations, and test through internal/closed testing before production.

## iOS
On a Mac:
1. Install Xcode and XcodeGen (`brew install xcodegen`).
2. In `ios/`, run `xcodegen generate`.
3. Open `KidKeepLearn.xcodeproj`.
4. Select your Apple Developer Team and signing identity.
5. Run on a device or archive for App Store Connect.

## Native capabilities included
- Responsive phone/tablet layout refinements.
- Local persistence from the existing web app.
- Camera/photo/document chooser support on Android.
- Camera/photo usage descriptions on iOS.
- Android back navigation.
- External link handling.

## Backend note
The current V107 experience is carried into the mobile builds. Features that are demo/local-browser data remain demo/local in the mobile build until production Supabase/API configuration is connected in `shared/www/config.js` and copied into each platform's bundled Web directory.
