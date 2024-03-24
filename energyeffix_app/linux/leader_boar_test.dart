import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:your_app_name_here/Components/CustomAppBar.dart';
import 'package:your_app_name_here/Components/CustomDrawer.dart';
import 'package:your_app_name_here/LeaderboardPage.dart';

void main() {
  testWidgets('LeaderboardPage widget test', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: LeaderboardPage(),
      ),
    );

    // Verify that the CustomAppBar and CustomDrawer are present
    expect(find.byType(CustomAppBar), findsOneWidget);
    expect(find.byType(CustomDrawer), findsOneWidget);

    // Verify that leaderboard items are displayed
    expect(find.byType(CircleAvatar), findsNWidgets(15)); // Assuming there are 15 users in the sample data
    expect(find.text('Rank: 1'), findsOneWidget);
    expect(find.text('Rank: 2'), findsOneWidget);
    expect(find.text('Rank: 3'), findsOneWidget);
    // Add more expectations as needed for other leaderboard items

    // Verify that the leaderboard table is displayed
    expect(find.byType(DataTable), findsOneWidget);
  });
}
