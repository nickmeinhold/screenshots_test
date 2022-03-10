import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:screenshots_test/main.dart' as app;

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
      as IntegrationTestWidgetsFlutterBinding;

  testWidgets('screenshot', (WidgetTester tester) async {
    // Build the app.
    app.main();

    // This is required prior to taking the screenshot (Android only).
    // await binding.convertFlutterSurfaceToImage();

    // Trigger a frame.
    await tester.pumpAndSettle();
    var screenshotBytes = await binding.takeScreenshot('screenshot-1');

    final File image = File('/tmp/screenshot.png');
    image.writeAsBytesSync(screenshotBytes);
  });
}
