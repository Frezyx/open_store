library open_store;

import 'dart:io';

import 'package:flutter/services.dart';
import 'package:open_store/src/src.dart';
import 'package:url_launcher/url_launcher.dart';

class OpenStore {
  OpenStore._();

  static final OpenStore _instance = OpenStore._();
  static OpenStore get instance => _instance;

  Future<void> open({
    required String appStoreId,
    required String androidAppBundleId,
  }) async {
    if (Platform.isIOS) {
      await _openAppStore(appStoreId);
    } else if (Platform.isAndroid) {
      await _openGooglePlay(appStoreId);
    } else
      throw PlatformException(code: 'Platform not supported');
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
