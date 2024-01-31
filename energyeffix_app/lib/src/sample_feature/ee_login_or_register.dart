import 'package:flutter/material.dart';

class ee_login_or_register extends StatelessWidget {
  const ee_login_or_register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ImageLogo with appropriate size and fit
            Image.asset(
              'assets/images/energy_effix_logo.png', // logo path
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20), // Add spacing between elements
            // Welcome label with clear and bold text
            const Text(
              'Welcome to EnergyEffix',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40), // Add spacing before buttons
            // Sign in button with explicit padding and consistent styling
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/sign_in'),
                child: const Text('Sign In'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(15),
                ),
              ),
            ),
            const SizedBox(height: 20), // Add spacing between buttons
            // Register button with consistent styling
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/register'),
                child: const Text('Register'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
