import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:energyeffix_app/about.dart';

void main() {
  testWidgets('About widget displays correct information', (WidgetTester tester) async {
    // Build the About widget
    await tester.pumpWidget(MaterialApp(home: About()));

    // Assert
    expect(find.text('Welcome to EnergyEffix'), findsOneWidget);
    expect(find.text('Our Mission'), findsOneWidget);
    expect(find.text('Empower users to take control of their energy consumption,'), findsOneWidget);
    expect(find.byIcon(Icons.phone), findsOneWidget);
    expect(find.byIcon(Icons.email), findsOneWidget);
    expect(find.byIcon(Icons.facebook), findsOneWidget);
    expect(find.byIcon(Icons.insert_page_break_rounded), findsOneWidget);
    expect(find.byIcon(Icons.link), findsOneWidget);
    expect(find.byIcon(Icons.gps_off_outlined), findsOneWidget);
  });

  // Test for social buttons onTap callbacks
  testWidgets('Test onTap callbacks for social buttons', (WidgetTester tester) async {
    // Build the About widget
    await tester.pumpWidget(MaterialApp(home: About()));

    // Tap each social button and verify that the corresponding URL launcher function is called
    await tester.tap(find.byIcon(Icons.phone));
    expect(launch, calledWith("tel:+94769173010"));

    await tester.tap(find.byIcon(Icons.email));
    expect(launch, calledWith("mailto:ridma.dev@gmail.com"));

    // Add tests for other social buttons onTap callbacks similarly
  });
}
