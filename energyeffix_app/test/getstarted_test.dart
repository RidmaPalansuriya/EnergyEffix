import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:energyeffix_app/GetStarted.dart';

void main() {
  testWidgets('GetStartedScreen Widget Test', (WidgetTester tester) async {
    // Build the GetStartedScreen widget and trigger a frame
    await tester.pumpWidget(MaterialApp(home: GetStartedScreen()));

    // Verify that the title "Get Started" is displayed correctly
    expect(find.text('Get Started'), findsOneWidget);

    // Verify that the skip button is displayed
    expect(find.text('Skip'), findsOneWidget);

    // Verify that the onboarding screens are displayed
    expect(find.byType(PageView), findsOneWidget);

    // Verify that the back and next buttons are displayed
    expect(find.text('Back'), findsOneWidget);
    expect(find.text('Next'), findsOneWidget);

    // Tap on the next button and verify navigation
    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();
    expect(find.text('Welcome to \nEnergyEffix'), findsOneWidget); // Adjust this assertion based on your navigation logic
  });
}
