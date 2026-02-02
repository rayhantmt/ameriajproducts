import 'dart:io';

class RevenueCatConfig {
  // Get these from: https://app.revenuecat.com → Project Settings → API Keys
  static const String _iosApiKey = 'appl_nHQtxkbnnfGSBbdOAHHwshyHDSc';
  static const String _androidApiKey = 'goog_FVrScVdjkGMmhTEfqWEDLZztEvU';
  
  // ✅ Get the correct key based on platform
  static String get apiKey {
    if (Platform.isIOS) {
      return _iosApiKey;
    } else if (Platform.isAndroid) {
      return _androidApiKey;
    } else {
      throw UnsupportedError('Platform not supported');
    }
  }
  
  // Your entitlement identifier from RevenueCat Dashboard
  static const String entitlementId = 'Yearly';
}