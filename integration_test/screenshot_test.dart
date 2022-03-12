import 'dart:io';

import 'package:screenshots_test/main.dart' as app;
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
  as IntegrationTestWidgetsFlutterBinding;
  String platform = Platform.isAndroid ? 'android' : 'ios';

  testWidgets('screenshot', (WidgetTester tester) async {
    app.main();
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    late String emulatorName;
    if (Platform.isAndroid) {
      // This is required prior to taking the screenshot (Android only).
      await binding.convertFlutterSurfaceToImage();

      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      emulatorName = androidInfo.model.toString();
    } else {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      emulatorName = iosInfo.name!;
    }
    final screenshotDir = '/tmp/screenshots/$platform/$emulatorName';
    Directory(screenshotDir).createSync(recursive: true);

    await tester.pumpAndSettle();
    var screenshotBytes = await binding.takeScreenshot('screenshot-1');

    final File image = File('$screenshotDir/first_screen.png');
    image.writeAsBytesSync(screenshotBytes);
  });
}
