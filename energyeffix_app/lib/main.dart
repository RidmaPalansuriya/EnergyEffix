import 'package:energyeffix_app/Components/MyDrawer.dart';
import 'package:energyeffix_app/About.dart';
import 'package:energyeffix_app/SettingsPage.dart';
import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

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
import 'About.dart';
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

        '/mydrawer' :(context) =>  MyDrawer(userName: "Ridma Palansuriya", userId: "12345678", points: 2000,),

        '/about': (context) => About(),
        '/settings': (context) => SettingsPage(),
      },

    );
  }
}




