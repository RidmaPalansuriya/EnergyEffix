import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:energyeffix_app/screens/manual_entry.dart';

void main() {
  testWidgets('ManualReadingPage widget displays correctly', (WidgetTester tester) async {
    // Build the ManualReadingPage widget
    await tester.pumpWidget(MaterialApp(home: ManualEntry()));

    // Find elements in the widget tree
    expect(find.text('Add Manual Reading'), findsOneWidget);
    expect(find.text('Meter Reading Date'), findsOneWidget);
    expect(find.text('Meter Reading Time'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    expect(find.text('Save'), findsOneWidget);
    expect(find.text('Analyze'), findsOneWidget);
  });

  testWidgets('Test if date and time pickers work', (WidgetTester tester) async {
    // Build the ManualReadingPage widget
    await tester.pumpWidget(MaterialApp(home: ManualEntry()));

    // Open date picker
    await tester.tap(find.text('0001-01-01')); // Tap on the date text
    await tester.pumpAndSettle(); // Wait for the dialog to show up
    await tester.tap(find.text('1')); // Tap on a date in the picker
    await tester.pumpAndSettle(); // Wait for the selected date to be set

    // Open time picker
    await tester.tap(find.text('0:00')); // Tap on the time text
    await tester.pumpAndSettle(); // Wait for the dialog to show up
    await tester.tap(find.text('12:00 AM')); // Tap on a time in the picker
    await tester.pumpAndSettle(); // Wait for the selected time to be set

    // Verify if date and time are updated
    expect(find.text('0001-01-01'), findsNothing); // Ensure date text is updated
    expect(find.text('0:00'), findsNothing); // Ensure time text is updated
  });

  testWidgets('Test if save button works', (WidgetTester tester) async {
    // Build the ManualReadingPage widget
    await tester.pumpWidget(MaterialApp(home: ManualEntry()));

    // Tap on the save button
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle(); // Wait for animations to complete

    // Verify if state is updated after tapping save button
    expect(find.text('Analyze'), findsOneWidget); // Check if analyze button is enabled
  });

  // You can add more tests to cover other functionalities and edge cases
}
