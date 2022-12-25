# OpenStore

😎 Simple flutter package to open app page in store<br>
😍 Without native platform code

<table>
  <td>
    <p>Android</p>
    <img src="https://github.com/Frezyx/open_store/blob/main/example/repo/e_android.gif?raw=true" height = 400px>
  </td>
  <td>
    <p>iOS</p>
    <img src="https://github.com/Frezyx/open_store/blob/main/example/repo/e_ios.gif?raw=true" height = 400px>
  </td>
<table>

* How to open app page in AppStore from Flutter ?
* How to open app page in GooglePlay from Flutter ? 


# Getting Started

### Add dependency

```yaml
dependencies:
  open_store: ^0.4.0
```

### Add import package

```dart
import 'package:open_store/open_store.dart';
```

### Easy to use

Add method calling when you need open app page in store

```dart
    OpenStore.instance.open(
        appName: 'Google', // App name
        appStoreId: '284815942', // AppStore id of your app for iOS
        appStoreIdMacOS: '284815942', // AppStore id of your app for MacOS (appStoreId used as default)
        androidAppBundleId: 'com.google.android.googlequicksearchbox', // Android app bundle package name
        windowsProductId: '9NZTWSQNTD0S' // Microsoft store id for Widnows apps
    );
```

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.