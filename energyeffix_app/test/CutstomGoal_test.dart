import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:energyeffix_app/CustomGoal.dart'; // Import the ChallengeCreationPage widget

void main() {
  testWidgets('ChallengeCreationPage Widget Test', (WidgetTester tester) async {
    // Build the ChallengeCreationPage widget and trigger a frame
    await tester.pumpWidget(MaterialApp(home: ChallengeCreationPage()));

    // Verify that the title "Create Challenge" is displayed correctly
    expect(find.text('Create Challenge'), findsOneWidget);

    // Tap the "Save Challenge" button
    await tester.tap(find.widgetWithText(ElevatedButton, 'Save Challenge'));

    // Wait for animations to complete
    await tester.pumpAndSettle();

    // Verify that the subscription success dialog is displayed
    expect(find.text('Subscription Success'), findsOneWidget);

    // Verify that the dialog displays the correct subscription information
    expect(find.text('Time Frame: '), findsOneWidget);
    expect(find.text('Target Units: '), findsOneWidget);
    expect(find.text('Alert Percentage: '), findsOneWidget);

    // Add more specific assertions as needed based on your requirements
  });
}
