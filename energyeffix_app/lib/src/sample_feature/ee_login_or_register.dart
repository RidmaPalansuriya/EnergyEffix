<<<<<<< Updated upstream
import 'dart:math';

import 'package:flutter/material.dart';

/// Displays detailed information about a SampleItem.
class SampleItemDetailsView extends StatelessWidget {
  const SampleItemDetailsView({super.key});

  static const routeName = '/sample_item';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1D1E33), // Added background color

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // EnergyEffix Logo Image with appropriate size and fit
            Image.asset(
              'assets/images/energy_effix_logo.png', // logo path
              width: 160,
              height: 155,
              fit: BoxFit.cover,
            ),
            // ImageLogo with appropriate size and fit
            Image.asset(
              'assets/images/energy_effix_logo_text.png', // logo path
              width: 300,
              height: 35,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 50), // Add spacing between elements

            // Welcome label with clear and bold text (ensure sufficient contrast)
            const Text(
              'Already have an account?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),


            const SizedBox(height: 15), // Add spacing before buttons

            // Sign in button with explicit padding and consistent styling
            //Sign In Button
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/sign_in'), // Redirect to Sign In page
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                padding: const EdgeInsets.all(0.1),
                primary: Color(0xea19b6d6).withOpacity(1), // Set primary color for gradient
                onPrimary: Colors.white, // Ensure text visibility on gradient
                minimumSize: const Size(160, 45), // Set button size
                //primary: maxWidth: const Size(250, 60), // Set maximum width and height
              ),

              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xea19b6d6).withOpacity(1), // Leaner gradient
                      Colors.white,
                    ],
                  ),
                ),
                child: Center(
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 24, // Bolder text
                      fontWeight: FontWeight.w900,
                      color: Color(0xff1D1E33),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 32), // Add spacing between elements
            const Text(
              'Have not an account yet?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),

            const SizedBox(height: 15), // Add spacing between buttons
            // Register button with consistent styling
            //Sign In Button
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/sign_in'), // Redirect to Sign In page
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                padding: const EdgeInsets.all(0.1),
                primary: Color(0xea19b6d6).withOpacity(1), // Set primary color for gradient
                onPrimary: Colors.white, // Ensure text visibility on gradient
                minimumSize: const Size(160, 45), // Set button size
                //primary: maxWidth: const Size(250, 60), // Set maximum width and height
              ),

              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xea19b6d6).withOpacity(1), // Leaner gradient
                      Colors.white,
                    ],
                  ),
                ),
                child: Center(
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 24, // Bolder text
                      fontWeight: FontWeight.w900,
                      color: Color(0xff1D1E33),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 80),// add space

            Image.asset(
              'assets/images/Powered by EnergyMinders.png', // logo path
              width: 160,
              height: 24,
              fit: BoxFit.cover,
            ),

            //Icon(Icons.copyright_outlined, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
=======
// import 'dart:math';
//
// import 'package:flutter/material.dart';
//
// /// Displays detailed information about a SampleItem.
// class SampleItemDetailsView extends StatelessWidget {
//   const SampleItemDetailsView({super.key});
//
//   static const routeName = '/sample_item';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xff1D1E33), // Added background color
//
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // EnergyEffix Logo Image with appropriate size and fit
//             Image.asset(
//               'assets/images/energy_effix_logo.png', // logo path
//               width: 160,
//               height: 155,
//               fit: BoxFit.cover,
//             ),
//             // ImageLogo with appropriate size and fit
//             Image.asset(
//               'assets/images/energy_effix_logo_text.png', // logo path
//               width: 300,
//               height: 35,
//               fit: BoxFit.cover,
//             ),
//
//             const SizedBox(height: 50), // Add spacing between elements
//
//             // Welcome label with clear and bold text (ensure sufficient contrast)
//             const Text(
//               'Already have an account?',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
//             ),
//
//
//             const SizedBox(height: 15), // Add spacing before buttons
//
//             // Sign in button with explicit padding and consistent styling
//             //Sign In Button
//             ElevatedButton(
//               onPressed: () => Navigator.pushNamed(context, '/sign_in'), // Redirect to Sign In page
//               style: ElevatedButton.styleFrom(
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
//                 padding: const EdgeInsets.all(0.1),
//                 primary: Color(0xea19b6d6).withOpacity(1), // Set primary color for gradient
//                 onPrimary: Colors.white, // Ensure text visibility on gradient
//                 minimumSize: const Size(160, 45), // Set button size
//                 //primary: maxWidth: const Size(250, 60), // Set maximum width and height
//               ),
//
//               child: Ink(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(24),
//                   gradient: LinearGradient(
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                     colors: [
//                       Color(0xea19b6d6).withOpacity(1), // Leaner gradient
//                       Colors.white,
//                     ],
//                   ),
//                 ),
//                 child: Center(
//                   child: Text(
//                     'Sign In',
//                     style: TextStyle(
//                       fontSize: 24, // Bolder text
//                       fontWeight: FontWeight.w900,
//                       color: Color(0xff1D1E33),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//
//             const SizedBox(height: 32), // Add spacing between elements
//             const Text(
//               'Have not an account yet?',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
//             ),
//
//             const SizedBox(height: 15), // Add spacing between buttons
//             // Register button with consistent styling
//             //Sign In Button
//             ElevatedButton(
//               onPressed: () => Navigator.pushNamed(context, '/sign_in'), // Redirect to Sign In page
//               style: ElevatedButton.styleFrom(
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
//                 padding: const EdgeInsets.all(0.1),
//                 primary: Color(0xea19b6d6).withOpacity(1), // Set primary color for gradient
//                 onPrimary: Colors.white, // Ensure text visibility on gradient
//                 minimumSize: const Size(160, 45), // Set button size
//                 //primary: maxWidth: const Size(250, 60), // Set maximum width and height
//               ),
//
//               child: Ink(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(24),
//                   gradient: LinearGradient(
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                     colors: [
//                       Color(0xea19b6d6).withOpacity(1), // Leaner gradient
//                       Colors.white,
//                     ],
//                   ),
//                 ),
//                 child: Center(
//                   child: Text(
//                     'Register',
//                     style: TextStyle(
//                       fontSize: 24, // Bolder text
//                       fontWeight: FontWeight.w900,
//                       color: Color(0xff1D1E33),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//
//             const SizedBox(height: 80),// add space
//
//             Image.asset(
//               'assets/images/Powered by EnergyMinders.png', // logo path
//               width: 160,
//               height: 24,
//               fit: BoxFit.cover,
//             ),
//
//             //Icon(Icons.copyright_outlined, color: Colors.white),
//           ],
//         ),
//       ),
//     );
//   }
// }
>>>>>>> Stashed changes
