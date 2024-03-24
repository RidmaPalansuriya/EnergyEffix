import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:energyeffix_app/Devices.dart'; // Import the DevicesPage widget

void main() {
  testWidgets('DevicesPage Widget Test', (WidgetTester tester) async {
    // Build the DevicesPage widget and trigger a frame
    await tester.pumpWidget(MaterialApp(home: DevicesPage()));

    // Verify that the title "Devices" is displayed correctly
    expect(find.text('Devices'), findsOneWidget);

    // Verify that the bottom navigation bar is displayed
    expect(find.byType(BottomNavigationBar), findsOneWidget);

    // Tap on each bottom navigation bar item and verify navigation
    await tester.tap(find.byIcon(Icons.analytics));
    await tester.pumpAndSettle();
    expect(find.text('Analytics Page Content'), findsOneWidget); // Adjust this assertion based on your navigation logic

    await tester.tap(find.byIcon(Icons.star));
    await tester.pumpAndSettle();
    expect(find.text('Goal Page Content'), findsOneWidget); // Adjust this assertion based on your navigation logic

    await tester.tap(find.byIcon(Icons.attach_money));
    await tester.pumpAndSettle();
    expect(find.text('This is your Bill'), findsOneWidget); // Adjust this assertion based on your navigation logic

    // Verify that tapping the active devices tab does nothing
    await tester.tap(find.byIcon(Icons.devices));
    await tester.pump();
    expect(find.text('Devices Page Content'), findsOneWidget); // Verify that the Devices page content is still displayed
  });
}
