import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:energyeffix_app/SettingsPage.dart';

void main() {
  testWidgets('SettingsPage widget test', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(MaterialApp(home: SettingsPage()));

    // Verify that the settings sections and items are displayed correctly
    expect(find.text('Language'), findsOneWidget);
    expect(find.text('Dark Theme'), findsOneWidget);
    expect(find.text('Share Location'), findsOneWidget);
    expect(find.text('Currency'), findsOneWidget);
    expect(find.text('Font Size'), findsOneWidget);
    expect(find.text('Notification'), findsOneWidget);
    expect(find.text('Share Access'), findsOneWidget);

    // Toggle the Dark Theme switch and verify the state update
    await tester.tap(find.text('Dark Theme'));
    await tester.pump();
    expect(find.byType(Switch), findsOneWidget);
    // Assuming initial state is true (dark theme on)
    expect(tester.widget<Switch>(find.byType(Switch)).value, true);

    // Toggle the Share Location switch and verify the state update
    await tester.tap(find.text('Share Location'));
    await tester.pump();
    expect(find.byType(Switch), findsOneWidget);
    // Assuming initial state is false (location sharing off)
    expect(tester.widget<Switch>(find.byType(Switch)).value, true);

    // Change the currency dropdown value and verify the state update
    await tester.tap(find.text('Currency'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('USD').last);
    await tester.pumpAndSettle();
    // Assuming initial selected currency is LKR
    expect(find.text('USD'), findsOneWidget);

    // Change the font size dropdown value and verify the state update
    await tester.tap(find.text('Font Size'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Large').last);
    await tester.pumpAndSettle();
    // Assuming initial selected font size is Medium
    expect(find.text('Large'), findsOneWidget);

    // Toggle the Notification switch and verify the state update
    await tester.tap(find.text('Notification'));
    await tester.pump();
    expect(find.byType(Switch), findsOneWidget);
    // Assuming initial state is true (notifications on)
    expect(tester.widget<Switch>(find.byType(Switch)).value, true);

    // Toggle the Share Access switch and verify the state update
    await tester.tap(find.text('Share Access'));
    await tester.pump();
    expect(find.byType(Switch), findsOneWidget);
    // Assuming initial state is false (share access off)
    expect(tester.widget<Switch>(find.byType(Switch)).value, true);
  });
}
