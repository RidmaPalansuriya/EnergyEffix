import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:your_app_name/your_notification_widget_file.dart';

void main() {
  testWidgets('Notification widget displays correctly', (WidgetTester tester) async {
    // Define a list of notifications
    List<String> testNotifications = ['Notification 1', 'Notification 2', 'Notification 3'];

    // Build the Notification widget with test notifications
    await tester.pumpWidget(MaterialApp(home: Notification(notifications: testNotifications)));

    // Verify if app bar title is correct
    expect(find.text('Notifications'), findsOneWidget);

    // Verify if all notification items are displayed
    for (String notification in testNotifications) {
      expect(find.text(notification), findsOneWidget);
    }
  });

  // You can add more tests to cover additional functionalities and edge cases
}
