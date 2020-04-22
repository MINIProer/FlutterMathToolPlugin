import 'dart:async';

import 'package:flutter/services.dart';

class MathTool {
  static const MethodChannel _channel = const MethodChannel('math_tool');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> sumResult(int a, int b) async {
    final String result = await _channel.invokeMethod('getSumResult', {'a' : a, 'b' : b});
    return result;
  }
}
