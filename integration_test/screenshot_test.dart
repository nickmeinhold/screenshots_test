import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:screenshots_test/main.dart';

void main() {
  testWidgets('screenshot', (WidgetTester tester) async {
    final binding = IntegrationTestWidgetsFlutterBinding();
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    await binding.takeScreenshot('test-screenshot');

    // TODO: Add screenshot test
  });
}
