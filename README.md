# Creator Adda Mobile App

This project packages the Creator Adda website (`dist` build) as an installable Android/iOS app using Capacitor.

## What is included

- `web/`: bundled website assets
- `android/`: native Android project (generated)
- `ios/`: native iOS project (generated)
- `scripts/sync-web-assets.ps1`: sync latest website `dist` into `web/`

## Setup

1. Install dependencies

```bash
npm install
```

If PowerShell blocks `npm`, run `npm.cmd install`.

2. Regenerate/sync app content from website build

```bash
npm run cap:sync
```

3. Open native projects

```bash
npm run cap:android
npm run cap:ios
```

## Build Android APK (debug)

```bash
npm run android:build:debug
```

APK output path:

`android/app/build/outputs/apk/debug/app-debug.apk`

## Custom website dist location

If your website `dist` folder is elsewhere:

```bash
powershell -ExecutionPolicy Bypass -File scripts/sync-web-assets.ps1 -SourceDist "C:\path\to\dist"
```
