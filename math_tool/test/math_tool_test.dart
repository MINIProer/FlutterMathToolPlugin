import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:math_tool/math_tool.dart';

void main() {
  const MethodChannel channel = MethodChannel('math_tool');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await MathTool.platformVersion, '42');
  });
}
