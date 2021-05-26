# OpenStore

😎 Simple flutter package to open app page in store<br>
😍 Without native platform code

* How to open app page in AppStore from Flutter ?
* How to open app page in GooglePlay from Flutter ? 

# Getting Started

### Add dependency

```yaml
dependencies:
  open_store: ^0.0.2
```

### Add import package

```dart
import 'package:open_store/open_store.dart';
```

### Easy to use

Add method calling when you need open app page in store

```dart
    OpenStore.instance.open(
        appStoreId: '1111111111', //Your app id in appstore
        androidAppBundleId: 'com.example.app' //Your android bundle id
    );
```

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.