import 'dart:io';

import 'package:flutter/services.dart';
import 'package:open_store/src/src.dart';
import 'package:url_launcher/url_launcher.dart';

class OpenStore {
  OpenStore._();

  static final OpenStore _instance = OpenStore._();
  static OpenStore get instance => _instance;

  Future<void> open({
    String? appStoreId,
    String? androidAppBundleId,
  }) async {
    assert(appStoreId != null || androidAppBundleId != null,
        "You must pass one of this parameters");
    if (Platform.isIOS) {
      await _openIos(appStoreId);
    } else if (Platform.isAndroid) {
      await _openAndroid(androidAppBundleId);
    } else
      throw PlatformException(code: 'Platform not supported');
  }

  Future _openAndroid(String? androidAppBundleId) async {
    if (androidAppBundleId != null) {
      await _openGooglePlay(androidAppBundleId);
    } else
      throw CantLaunchPageException("androidAppBundleId is not passed");
  }

  Future _openIos(String? appStoreId) async {
    if (appStoreId != null) {
      await _openAppStore(appStoreId);
    } else
      throw CantLaunchPageException("appStoreId is not passed");
  }

  Future<void> _openAppStore(String androidAppBundleId) async {
    try {
      final pageUri = 'https://apps.apple.com/app/id$androidAppBundleId';
      _opeenCommon(pageUri);
    } catch (_) {
      rethrow;
    }
  }

  Future<void> _openGooglePlay(String androidAppBundleId) async {
    try {
      final pageUri =
          'https://play.google.com/store/apps/details?id=$androidAppBundleId';
      _opeenCommon(pageUri);
    } catch (_) {
      rethrow;
    }
  }

  Future<void> _opeenCommon(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw CantLaunchPageException('Could not launch $url');
    }
  }
}
