import 'dart:async';

import 'package:flutter/services.dart';

class Lovelydialogs {
  static const MethodChannel _channel =
      const MethodChannel('lovelydialogs');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
