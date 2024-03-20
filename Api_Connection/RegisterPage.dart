import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../SignIn.dart';
import '../User.dart';
import 'api_connection.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  void _register() {
    if (_passwordController.text != _confirmPasswordController.text) {
      // Passwords don't match
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Passwords do not match.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the AlertDialog
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // Check for empty fields
      if (_firstNameController.text.isEmpty) {
        Fluttertoast.showToast(msg: "First Name field is empty.");
        return;
      }
      if (_lastNameController.text.isEmpty) {
        Fluttertoast.showToast(msg: "Last Name field is empty.");
        return;
      }
      if (_emailController.text.isEmpty) {
        Fluttertoast.showToast(msg: "Email field is empty.");
        return;
      }
      if (!_emailController.text.contains('@gmail.com')) {
        Fluttertoast.showToast(msg: "Wrong type of email entered.");
        return;
      }
      if (_usernameController.text.isEmpty) {
        Fluttertoast.showToast(msg: "Username field is empty.");
        return;
      }
      if (_passwordController.text.length < 8) {
        Fluttertoast.showToast(
            msg: "Password must be at least 8 characters long.");
        return;
      }
      if (_passwordController.text.isEmpty) {
        Fluttertoast.showToast(msg: "Password field is empty.");
        return;
      }
      if (_confirmPasswordController.text.isEmpty) {
        Fluttertoast.showToast(msg: "Confirm Password field is empty.");
        return;
      }

      // If all fields are filled, proceed with email validation
      validateUserName();
    }
  }

  validateUserName() async {
    try {
      var res = await http.post(
        Uri.parse(API.validateUserName),
        body: {
          'usersUId': _usernameController.text.trim(),
        },
      );

      if (res.statusCode == 200) {
        var resBody = jsonDecode(res.body);

        if (resBody['usernameFound'] == true) {
          Fluttertoast.showToast(
              msg: "Username is already in use. Try another username.");
        } else {
          validateUserEmail();
        }
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  validateUserEmail() async {
    try {
      var res = await http.post(
        Uri.parse(API.validateEmail),
        body: {
          'usersEmail': _emailController.text.trim(),
        },
      );

      if (res.statusCode == 200) {
        var resBody = jsonDecode(res.body);

        if (resBody['emailFound'] == true) {
          Fluttertoast.showToast(
              msg: "Email is already in use. Try another email.");
        } else {
          registerUserRecord();
        }
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  registerUserRecord() async {
    User userModel = User(
      _firstNameController.text.trim(),
      _lastNameController.text.trim(),
      _emailController.text.trim(),
      _usernameController.text.trim(),
      _passwordController.text.trim(),
    );

    try {
      var res = await http.post(
        Uri.parse(API.signUp),
        body: userModel.toJson(),
      );

      if (res.statusCode == 200) {
        var resBodyOfSignUp = jsonDecode(res.body);
        if (resBodyOfSignUp['success'] == true) {
          Fluttertoast.showToast(
              msg: "Congratulations, you have successfully signed up.");
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => SignInPage()));
        } else {
          Fluttertoast.showToast(msg: "An error occurred. Please try again.");
        }
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTextField(_firstNameController, 'First Name'),
              _buildTextField(_lastNameController, 'Last Name'),
              _buildTextField(_emailController, 'Email',
                  keyboardType: TextInputType.emailAddress),
              _buildTextField(_usernameController, 'Username'),
              _buildTextField(_passwordController, 'Password',
                  isPassword: true),
              _buildTextField(_confirmPasswordController, 'Confirm Password',
                  isPassword: true),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _register,
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText,
      {TextInputType keyboardType = TextInputType.text,
      bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.grey[600]),
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        ),
        keyboardType: keyboardType,
        obscureText: isPassword,
      ),
    );
  }
}
