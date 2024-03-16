<<<<<<< Updated upstream
import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(MyApp(settingsController: settingsController));
}
=======
import 'package:energyeffix_app/src/LoadingPage.dart';
import 'package:energyeffix_app/src/RegisterPage.dart';
import 'package:energyeffix_app/src/Register_SignIn.dart';
import 'package:energyeffix_app/src/SignIn.dart';
import 'package:energyeffix_app/Home.dart';
import 'package:energyeffix_app/LeaderBoard.dart';

import 'package:flutter/material.dart';
import 'GetStarted.dart';
import 'ManualEntry.dart';
import 'custom_app_bar.dart'; // Import the custom app bar
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'CustomGoal.dart';
import 'Analytics.dart';
import 'Bill.dart';
import 'Devices.dart';
import 'Goal.dart';


void main() {
  runApp(EnergyEffixApp());
}

class EnergyEffixApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EnergyEffix',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoadingPage(),
        '/register_signin': (context) => RegisterSignInPage(),
        '/sign_in': (context) => SignInPage(),
        '/home': (context) => Home(),


        '/register': (context) => RegisterPage(), // Define the route for Register.dart

        //'/goal_test': (context) => GoalTest(),

        '/analytics': (context) => Analytics(),
        '/bill': (context) => Bill(),
        '/goal': (context) => GoalPage(),

        '/customgoal': (context) => CustomGoal(),

        '/leaderboard': (context) => LeaderboardPage(),
        '/device': (context) => DevicesPage(),

        '/getStarted': (context) => GetStartedScreen(), // Route for GetStartedScreen

        '/manualentry' : (context) => ManualEntry(),
      },

    );
  }
}



>>>>>>> Stashed changes
