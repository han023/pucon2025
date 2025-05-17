import 'package:flutter_test/flutter_test.dart';
import 'package:pucon2025/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('ForgetpassViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
