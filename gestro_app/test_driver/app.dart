import 'package:flutter_driver/driver_extension.dart';
import 'package:gestro_app/main.dart' as app;

// flutter drive --target=test_driver/app.dart

void main() {
  enableFlutterDriverExtension();
  app.main();
}
