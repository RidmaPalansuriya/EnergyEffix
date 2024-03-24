import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:energyeffix_app/About.dart'; // Import the About widget

void main() {
  testWidgets('About Widget Test', (WidgetTester tester) async {
    // Build the About widget and trigger a frame
    await tester.pumpWidget(MaterialApp(home: About()));

    // Verify that the title is displayed correctly
    expect(find.text('About EnergyEffix'), findsOneWidget);

    // Verify that the mission statement is displayed correctly
    expect(
        find.text(
            '"Empower users to take control of their energy consumption, navigate complex electricity tariffs,and make informed decisions for a more sustainable and cost-effective energy future."'),
        findsOneWidget);

    // Tap each social button and verify that onTap is triggered (currently empty)
    await tester.tap(find.byIcon(Icons.phone));
    await tester.tap(find.byIcon(Icons.email));
    // Add similar tests for other social buttons

    // Wait for animations to complete
    await tester.pumpAndSettle();

    // Verify that the onTap function for each social button is called
    // Here you may need to check whether the corresponding URL launcher function is called
  });
}
