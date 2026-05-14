import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:orc_app/main.dart';

void main() {
  testWidgets('ORC app loads successfully', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(const ORCApp());

    // Verify MaterialApp exists
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}