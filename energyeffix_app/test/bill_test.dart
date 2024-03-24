import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:energyeffix_app/Bill.dart'; // Import the Bill widget

void main() {
  testWidgets('Bill Widget Test', (WidgetTester tester) async {
    // Build the Bill widget and trigger a frame
    await tester.pumpWidget(MaterialApp(home: Bill()));

    // Verify that the title is displayed correctly
    expect(find.text('My Bill'), findsOneWidget);

    // Verify that the body contains the expected text
    expect(find.text('This is your Bill'), findsOneWidget);
  });
}
