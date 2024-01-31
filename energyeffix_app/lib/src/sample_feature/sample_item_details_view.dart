import 'package:flutter/material.dart';

/// Displays detailed information about a SampleItem.
class SampleItemDetailsView extends StatelessWidget {
  const SampleItemDetailsView({super.key});

  static const routeName = '/sample_item';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1D1E33), // Added background color
      appBar: AppBar(
        backgroundColor: const Color(0xff1D1E33), // Matched app bar color
        title: const Text('Item Details'),
      ),
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
            // Welcome label with clear and bold text (ensure sufficient contrast)
            const Text(
              'Welcome to EnergyEffix',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
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
