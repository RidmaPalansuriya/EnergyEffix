import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:energyeffix_app/main.dart';
import 'package:energyeffix_app/Home.dart';
import 'package:energyeffix_app/About.dart';
import 'package:energyeffix_app/Devices.dart';
import 'package:energyeffix_app/Profile.dart';
import 'package:energyeffix_app/SettingsPage.dart';
import 'package:energyeffix_app/src/Register_SignIn.dart';
import 'package:energyeffix_app/src/SignIn.dart';
import 'package:energyeffix_app/src/RegisterPage.dart';

void main() {
  testWidgets('Test route navigation', (WidgetTester tester) async {
    await tester.pumpWidget(EnergyEffixApp());

    // Navigate to the Home page
    await tester.tap(find.byKey(ValueKey('loading_page')));
    await tester.pumpAndSettle();
    expect(find.byType(Home), findsOneWidget);

    // Navigate to the About page
    await tester.tap(find.byKey(ValueKey('about_page')));
    await tester.pumpAndSettle();
    expect(find.byType(About), findsOneWidget);

    // Navigate to the Devices page
    await tester.tap(find.byKey(ValueKey('devices_page')));
    await tester.pumpAndSettle();
    expect(find.byType(DevicesPage), findsOneWidget);

    // Navigate to the Profile page
    await tester.tap(find.byKey(ValueKey('profile_page')));
    await tester.pumpAndSettle();
    expect(find.byType(Profile), findsOneWidget);

    // Navigate to the Settings page
    await tester.tap(find.byKey(ValueKey('settings_page')));
    await tester.pumpAndSettle();
    expect(find.byType(SettingsPage), findsOneWidget);

    // Navigate to the RegisterSignIn page
    await tester.tap(find.byKey(ValueKey('register_sign_in_page')));
    await tester.pumpAndSettle();
    expect(find.byType(RegisterSignInPage), findsOneWidget);

    // Navigate to the SignIn page
    await tester.tap(find.byKey(ValueKey('sign_in_page')));
    await tester.pumpAndSettle();
    expect(find.byType(SignInPage), findsOneWidget);

    // Navigate to the Register page
    await tester.tap(find.byKey(ValueKey('register_page')));
    await tester.pumpAndSettle();
    expect(find.byType(RegisterPage), findsOneWidget);
  });

  // Add more widget tests for other widgets if needed
}
