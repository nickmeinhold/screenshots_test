# screenshots_test

Testing taking screenshots in GitHub Actions.

Followed these articles:

- [Take screenshot during Flutter integration tests - DEV Community](https://dev.to/mjablecnik/take-screenshot-during-flutter-integration-tests-435k)
- [Flutter automated screenshot testing using the integration_test package | Codemagic Blog](https://blog.codemagic.io/flutter-automated-screenshot-testing/)

Running `flutter drive --driver=integration_test/screenshot_test_driver.dart --target=integration_test/screenshot_test.dart -d <iphone_emulator_id>`

gives:

```sh
flutter: 'package:flutter/src/foundation/binding.dart':
Failed assertion: line 55 pos 12:
flutter: '!_debugInitialized': is not true.
```
