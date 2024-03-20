import 'dart:convert';
import 'package:energy_effix/GetStarted.dart';
import 'package:energy_effix/Home.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../User.dart';
import 'api_connection.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import '../Home.dart';
import 'user_preferences.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _passwordVisible = false;

  void signIn() async {
    try {
      var res = await http.post(
        Uri.parse(API.signIn),
        body: {
          'usersUId': userNameController.text.trim(),
          'usersPwd': passwordController.text.trim(),
        },
      );

      if (res.statusCode == 200) {
        var resBodyOfLogin = jsonDecode(res.body);
        if (resBodyOfLogin['success'] == true) {
          Fluttertoast.showToast(msg: "You are logged-in Succesfully.");

          User userInfo = User.fromJson(resBodyOfLogin['userData']);

          await RememberUserPrefs.storeUserInfo(userInfo);

          // Navigate to the home page
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => GetStartedScreen()));
        } else {
          // Show an error message or handle incorrect credentials accordingly
          print('Incorrect username or password. Please try again later.');

          // For now, let's show a pop-up message
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Incorrect Credentials'),
                content: Text(
                    'The entered username or password is incorrect. Please try again later.'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the alert dialog
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      } else {
        // Handle other HTTP status codes
        print('Failed to authenticate. Status code: ${res.statusCode}');
      }
    } catch (e) {
      print('Error:' + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D1E33),
      appBar: AppBar(
        backgroundColor: Color(0xFF1D1E33),
        title: null,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              // Row with Image and Text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // EnergyEffix Logo Circle Only
                  Image.asset(
                    'assets/images/energy_effix_logo.png',
                    width: 60,
                    height: 59,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 20),
                  // Text "Welcome back to EnergyEffix"
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome back to',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 5),
                      // EnergyEffix Logo Text Only
                      Image.asset(
                        'assets/images/energy_effix_logo_text.png',
                        width: 130,
                        height: 15,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 50),

              // User Name input field
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  controller: userNameController,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Days One',
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Username/Email',
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 20,
                      fontFamily: 'Days One',
                      fontWeight: FontWeight.w400,
                    ),
                    filled: true,
                    fillColor: Color(0xFF262626),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    prefixIcon: Icon(Icons.email, color: Colors.white),
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Password input field
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  controller: passwordController,
                  obscureText: !_passwordVisible,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Days One',
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 20,
                      fontFamily: 'Days One',
                      fontWeight: FontWeight.w400,
                    ),
                    filled: true,
                    fillColor: Color(0xFF262626),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    prefixIcon: Icon(Icons.lock, color: Colors.white),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Sign In button
              ElevatedButton(
                onPressed: signIn,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32)),
                  backgroundColor: Color(0xFF19B6D6),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  minimumSize: Size(MediaQuery.of(context).size.width * 0.8,
                      45), // Set the sign-in button color
                ),
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: Color(0xff1D1E33),
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Row for Registration Text and Button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Have not an account yet?',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(width: 5),
                  // Transparent Background Button "Register"
                  TextButton(
                    onPressed: () {
                      // Navigate to the registration page when the button is pressed
                      Navigator.pushReplacementNamed(context, '/register');
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.transparent),
                    ),
                    child: Text(
                      'Register',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
