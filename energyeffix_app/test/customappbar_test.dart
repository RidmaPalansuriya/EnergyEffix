import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:energyeffix_app/Components/CustomAppBar.dart';

void main() {
  testWidgets('CustomAppBar widget test', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: CustomAppBar(
            pageTitle: 'Test Page',
            onBackPress: () {}, // Provide a dummy callback for testing
          ),
        ),
      ),
    );

    // Verify that the page title is displayed
    expect(find.text('Test Page'), findsOneWidget);

    // Verify that the back button works
    await tester.tap(find.byIcon(Icons.arrow_back_ios_new_rounded));
    await tester.pump(); // Rebuild the widget after tapping
    // Add expectations based on the expected behavior of the back button

    // Verify that the leading icon button opens the drawer when onBackPress is not provided
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pump(); // Rebuild the widget after tapping
    // Add expectations based on the expected behavior of the leading icon button
  });
}
