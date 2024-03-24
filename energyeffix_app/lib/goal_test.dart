import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:energyeffix_app/Goal.dart';

void main() {
  testWidgets('Goal widget test', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(MaterialApp(home: Goal()));

    // Verify that the carousel slider displays images
    expect(find.byType(CarouselSlider), findsOneWidget);
    expect(find.byType(Image), findsNWidgets(5)); // Assuming there are 5 images in the slider

    // Verify that buttons for navigating to different pages are clickable
    await tester.tap(find.text('Our Champs'));
    await tester.pumpAndSettle();
    expect(find.byType(LeaderboardPage), findsOneWidget);

    await tester.tap(find.text('My Rewards'));
    await tester.pumpAndSettle();
    expect(find.byType(MyRewardsPage), findsOneWidget);

    await tester.tap(find.text('Energy Saving Tips'));
    await tester.pumpAndSettle();
    expect(find.byType(EnergySavingTipsPage), findsOneWidget);

    await tester.tap(find.text('View My Badges'));
    await tester.pumpAndSettle();
    expect(find.byType(ViewMyBadgesPage), findsOneWidget);

    // Verify that clicking on the "Create a Customized Goal" floating action button navigates to the correct page
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    expect(find.byType(CustomGoal), findsOneWidget);

    // You can add more specific tests for the daily challenge cards here if needed
    // For example, testing the content and functionality of the challenge cards
  });
}
