import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:energyeffix_app/MyDrawer.dart';

void main() {
  testWidgets('MyDrawer widget test', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          drawer: MyDrawer(
            userName: 'John Doe',
            userId: '123456',
            points: 500,
          ),
        ),
      ),
    );

    // Verify that user information is displayed correctly
    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('ID: 123456'), findsOneWidget);
    expect(find.text('Points: 500'), findsOneWidget);

    // Tap on each drawer button and verify navigation
    await tester.tap(find.byIcon(Icons.analytics));
    await tester.pumpAndSettle();
    expect(find.text('Analytics Page'), findsOneWidget); // Assuming 'Analytics Page' is the title of the destination page

    await tester.tap(find.byIcon(Icons.input));
    await tester.pumpAndSettle();
    expect(find.text('Manual Input Page'), findsOneWidget); // Assuming 'Manual Input Page' is the title of the destination page

    await tester.tap(find.byIcon(Icons.device_hub));
    await tester.pumpAndSettle();
    expect(find.text('Add Device Page'), findsOneWidget); // Assuming 'Add Device Page' is the title of the destination page

    // Add more similar tests for other drawer buttons as needed
  });
}
