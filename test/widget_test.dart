// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:drippydrop_app/core/routing/app_routing.dart';
import 'package:drippydrop_app/drippy_drop_app.dart' show DrippyDropApp;
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Splash screen loads correctly', (WidgetTester tester) async {
    await tester.pumpWidget(DrippyDropApp(appRouter: AppRouter()));

    expect(find.text('Welcome'), findsOneWidget);
  });
}
