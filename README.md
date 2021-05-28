# OpenStore

😎 Simple flutter package to open app page in store<br>
😍 Without native platform code

* How to open app page in AppStore from Flutter ?
* How to open app page in GooglePlay from Flutter ? 

# Getting Started

### Add dependency

```yaml
dependencies:
  open_store: ^0.2.1
```

### Add import package

```dart
import 'package:open_store/open_store.dart';
```

### Easy to use

Add method calling when you need open app page in store

```dart
    OpenStore.instance.open(
        appStoreId: '284815942', // AppStore id of your app
        androidAppBundleId: 'com.google.android.googlequicksearchbox', // Android app bundle package name
    );
```

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.