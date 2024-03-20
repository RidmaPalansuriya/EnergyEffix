import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  double _imageSize = 200.0; // Initial size of the image

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    Future.delayed(Duration(seconds: 5), () {
      // Navigate to RegisterSignInPage after 5 seconds
      Navigator.pushReplacementNamed(context, '/register_signin');
    });

    // Decrease the size of the image gradually over 5 seconds
    for (int i = 1; i <= 5; i++) {
      Future.delayed(Duration(seconds: i), () {
        setState(() {
          _imageSize -= 40.0; // Adjust the decrement value based on your preference
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1D1E33), // Added background color

      body: SafeArea(
        child: Center(
          child: AnimatedContainer(
            duration: Duration(seconds: 5), // Same duration as the delay
            width: _imageSize,
            height: _imageSize,
            child: Image.asset('assets/images/energy_effix_logo.png'),
          ),
        ),
      ),
    );
  }
}