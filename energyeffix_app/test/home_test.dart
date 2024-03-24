import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:energyeffix_app/home.dart';

void main() {
  testWidgets('Home widget displays correctly', (WidgetTester tester) async {
    // Build the Home widget
    await tester.pumpWidget(MaterialApp(home: Home()));

    // Verify if the GreetingWidget is displayed
    expect(find.byType(GreetingWidget), findsOneWidget);

    // Verify if the 'Add Device' button is displayed
    expect(find.text('Add Device'), findsOneWidget);

    // Verify if the 'Manual Input' button is displayed
    expect(find.text('Manual Input'), findsOneWidget);

    // Verify if the CarouselSlider is displayed
    expect(find.byType(CarouselSlider), findsOneWidget);

    // Verify if the daily challenge cards are displayed
    expect(find.text('Daily Challenge 1'), findsOneWidget);
    expect(find.text('Daily Challenge 2'), findsOneWidget);
    expect(find.text('Daily Challenge 3'), findsOneWidget);
    expect(find.text('Daily Challenge HEHE'), findsOneWidget);
    expect(find.text('Daily Challenge yoyo'), findsOneWidget);
    expect(find.text('Daily Challenge 6'), findsOneWidget);
  });

  // You can add more tests to cover additional functionalities and edge cases
}
