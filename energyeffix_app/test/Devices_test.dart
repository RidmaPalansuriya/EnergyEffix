import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:energyeffix_app/your_devices_widget_file.dart';

void main() {
  testWidgets('Devices widget displays correctly', (WidgetTester tester) async {
    // Build the Devices widget
    await tester.pumpWidget(MaterialApp(home: Devices()));

    // Verify if 'Serial Number' text field is displayed
    expect(find.text('Serial Number'), findsOneWidget);

    // Verify if 'Meter ID' text field is displayed
    expect(find.text('Meter ID'), findsOneWidget);

    // Verify if 'Allow access to the Smart Meter' text is displayed
    expect(find.text('Allow access to the Smart Meter'), findsOneWidget);

    // Verify if the checkbox is displayed
    expect(find.byType(Checkbox), findsOneWidget);

    // Verify if 'Add Device' button is displayed
    expect(find.text('Add Device'), findsOneWidget);
  });

  // You can add more tests to cover additional functionalities and edge cases
}
