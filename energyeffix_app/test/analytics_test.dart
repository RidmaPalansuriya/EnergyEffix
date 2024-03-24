import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:energyeffix_app/Components/MyNavBar.dart';
import 'package:energyeffix_app/screens/analytics.dart';

void main() {
  testWidgets('Analytics widget displays correctly', (WidgetTester tester) async {
    // Build the Analytics widget
    await tester.pumpWidget(MaterialApp(home: Analytics()));

    // Assert
    expect(find.text('Analytics1'), findsOneWidget); // Check for app bar title
    expect(find.text('Your Energy Usage'), findsOneWidget); // Check for text in the body
    expect(find.byType(MyNavBar), findsOneWidget); // Check for the presence of MyNavBar widget
  });
}
