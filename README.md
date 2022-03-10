# screenshots_test

Testing taking screenshots in GitHub Actions.

See Notion > [Integration Testing](https://www.notion.so/reference-material/Integration-Testing-1c3d3880e0fe4e62a69d14045704715d)

## Step 1

Following these articles

- [Take screenshot during Flutter integration tests - DEV Community](https://dev.to/mjablecnik/take-screenshot-during-flutter-integration-tests-435k)
- [Flutter automated screenshot testing using the integration_test package | Codemagic Blog](https://blog.codemagic.io/flutter-automated-screenshot-testing/)

And running `flutter drive --driver=integration_test/screenshot_test_driver.dart --target=integration_test/screenshot_test.dart -d <iphone_emulator_id>`

gives:

```sh
flutter: 'package:flutter/src/foundation/binding.dart':
Failed assertion: line 55 pos 12:
flutter: '!_debugInitialized': is not true.
```

## Step 2

Importing flutter_driver

```yml
flutter_driver:
    sdk: flutter
```

And adding `enableFlutterDriverExtension();` as the first line of `main()` in `screenshot_test_driver.dart`

gives:

```sh
../../SDKs/flutter/packages/flutter/lib/src/cupertino/bottom_tab_bar.dart:5:8: Error: Not found: 'dart:ui'
import 'dart:ui' show ImageFilter;
       ^
../../SDKs/flutter/packages/flutter/lib/src/cupertino/colors.dart:5:8: Error: Not found: 'dart:ui'
import 'dart:ui' show Color, Brightness;
       ^
...
```

## Step 3

Updating code to match the latest instructions at: https://github.com/flutter/flutter/tree/master/packages/integration_test

Gives the error described in: https://github.com/flutter/flutter/issues/91668

Using the workaround described in the issue, ie.

updating `flutter/packages/integration_test/ios/Classes/IntegrationTestPlugin.m`

by adding a body to:

```objc
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar {
```

to make it:

```objc
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar {
    [[IntegrationTestPlugin instance] setupChannels:registrar.messenger];
}
```

And screenshots now work.

## Usage

```sh
flutter drive \                                   
  --driver=test_driver/integration_test.dart \
  --target=integration_test/screenshot_test.dart
```
