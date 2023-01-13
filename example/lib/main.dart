import 'package:flutter/material.dart';
import 'package:open_store/open_store.dart';

void main() {
  runApp(const UpenStoreExample());
}

class UpenStoreExample extends StatelessWidget {
  const UpenStoreExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            OpenStore.instance.open(
              appName: 'Google',
              appStoreId: '1543803459',
              androidAppBundleId: 'com.google.android.googlequicksearchbox',
            );
          },
          child: const Text('Open store'),
        ),
      ),
    );
  }
}
