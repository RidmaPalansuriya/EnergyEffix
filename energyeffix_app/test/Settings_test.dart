import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:energyeffix_app/SettingsPage.dart';

void main() {
  testWidgets('SettingsPage Widget Test', (WidgetTester tester) async {
    // Build the SettingsPage widget and trigger a frame
    await tester.pumpWidget(MaterialApp(home: SettingsPage()));

    // Verify that the SettingsPage contains all the expected widgets
    expect(find.text('Settings'), findsOneWidget);
    expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    expect(find.text('Language'), findsOneWidget);
    expect(find.text('Theme'), findsOneWidget);
    expect(find.text('Smart Meter'), findsOneWidget);
    expect(find.text('Share Location'), findsOneWidget);
    expect(find.text('Currency'), findsOneWidget);
    expect(find.text('Font Size'), findsOneWidget);
    expect(find.text('Notification'), findsOneWidget);
    expect(find.text('Share Access'), findsOneWidget);
  });
}
