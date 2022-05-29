import 'dart:io';

import 'package:flutter/services.dart';
import 'package:open_store/src/src.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class OpenStore {
  OpenStore._();

  static final OpenStore _instance = OpenStore._();

  /// Returns an instance using the default [OpenStore].
  static OpenStore get instance => _instance;

  static const _playMarketUrl =
      'https://play.google.com/store/apps/details?id=';
  static const _appStoreUrlIOS = 'https://apps.apple.com/app/id';
  static const _appStoreUrlMacOS =
      'https://apps.apple.com/ru/app/g-app-launcher/id';

  /// Main method of this package
  /// Allows to open your app's page in store by platform
  ///
  /// Enabled for Android & iOS
  /// [PlatformException] will throw if you try using this package in other OS
  ///
  /// [CantLaunchPageException] will throw if you don't specify
  /// app id on Platform that you useing right now
  Future<void> open({
    String? appStoreId,
    String? androidAppBundleId,
  }) async {
    assert(
      appStoreId != null || androidAppBundleId != null,
      "You must pass one of this parameters",
    );

    if (kIsWeb) {
      throw PlatformException(code: 'Platform not supported');
    }

    if (Platform.isIOS) {
      await _openIOS(appStoreId);
      return;
    }
    if (Platform.isMacOS) {
      await _openMacOS(appStoreId);
      return;
    }
    if (Platform.isAndroid) {
      await _openAndroid(androidAppBundleId);
      return;
    }

    throw PlatformException(code: 'Platform not supported');
  }

  Future _openAndroid(String? androidAppBundleId) async {
    if (androidAppBundleId != null) {
      await _openGooglePlay(androidAppBundleId);
      return;
    }
    throw CantLaunchPageException("androidAppBundleId is not passed");
  }

  Future _openIOS(String? appStoreId) async {
    if (appStoreId != null) {
      await _openAppStoreIOS(appStoreId);
      return;
    }
    throw CantLaunchPageException("appStoreId is not passed");
  }

  Future _openMacOS(String? appStoreId) async {
    if (appStoreId != null) {
      await _openAppStoreMacOS(appStoreId);
      return;
    }
    throw CantLaunchPageException("appStoreId is not passed");
  }

  Future<void> _openAppStoreIOS(String appStoreBundleId) async {
    final pageUri = '$_appStoreUrlIOS$appStoreBundleId';
    await _openUrl(pageUri);
  }

  Future<void> _openAppStoreMacOS(String appStoreBundleId) async {
    final pageUri = '$_appStoreUrlMacOS$appStoreBundleId';
    await _openUrl(pageUri);
  }

  Future<void> _openGooglePlay(String androidAppBundleId) async {
    final pageUri = '$_playMarketUrl$androidAppBundleId';
    await _openUrl(pageUri);
  }

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
      return;
    }
    throw CantLaunchPageException('Could not launch $url');
  }
}
