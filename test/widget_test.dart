import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:training_app_hive/my_app.dart';

void main() {
  testWidgets('Welcome page view test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Use app!'), findsOneWidget);

    await tester.tap(find.byKey(const Key('inputToApp')));
    await tester.pump();

    expect(find.text('Use app!'), findsNothing);
  });
}
