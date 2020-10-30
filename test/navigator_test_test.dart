import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:navigator_test/navigator_test.dart';

void main() {
  const MethodChannel channel = MethodChannel('navigator_test');

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
    expect(await NavigatorTest.platformVersion, '42');
  });
}
