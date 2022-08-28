import 'package:flutter/material.dart';
import 'package:open_store/open_store.dart';

void main() {
  runApp(UpenStoreExample());
}

class UpenStoreExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            OpenStore.instance.open(
              appStoreId: '1543803459',
              // androidAppBundleId: 'com.google.android.googlequicksearchbox',
            );
          },
          child: Text('Open store'),
        ),
      ),
    );
  }
}
