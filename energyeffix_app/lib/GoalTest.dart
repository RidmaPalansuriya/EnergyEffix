// import 'package:flutter/material.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
//
// void main() {
//   runApp(FigmaToCodeApp());
// }
//
// class FigmaToCodeApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData.dark().copyWith(
//         scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
//       ),
//       home: Goal(),
//     );
//   }
// }
//
// class Goal extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 100,
//         backgroundColor: Color(0xff0071aa),
//         leading: Builder(
//           builder: (BuildContext context) {
//             return IconButton(
//               onPressed: () {
//                 Scaffold.of(context).openDrawer();
//               },
//               icon: Icon(Icons.menu),
//               color: Colors.white,
//               tooltip: "Top Navigation Bar Menu",
//               iconSize: 45,
//             );
//           },
//         ),
//         // ... (Other app bar components)
//       ),
//       drawer: Drawer(
//         child: ListView(
//           children: [
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Color(0xff0071aa),
//               ),
//               child: Text(
//                 'Drawer Header',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                 ),
//               ),
//             ),
//             ListTile(
//               title: Text('Item 1'),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               title: Text('Item 2'),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         ),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               buildButtonGrid(context),
//               SizedBox(height: 16),
//               buildSectionOptions(context),
//               SizedBox(height: 16),
//               buildGoalButton(context, 'EcoShop', 'https://via.placeholder.com/150x50'),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: CurvedNavigationBar(
//         height: 65.0,
//         color: Colors.transparent,
//         buttonBackgroundColor: Color(0xff1D1E33),
//         backgroundColor: Color(0xff0071aa),
//         animationCurve: Curves.easeInOut,
//         animationDuration: const Duration(milliseconds: 400),
//         index: 2, // Assuming Goal is the current page
//         items: [
//           Icon(Icons.home_rounded, size: 26, color: Colors.white),
//           Icon(Icons.analytics, size: 26, color: Colors.white),
//           Icon(Icons.star, size: 26, color: Colors.white),
//           Icon(Icons.attach_money_rounded, size: 26, color: Colors.white),
//           Icon(Icons.devices, size: 26, color: Colors.white),
//         ],
//         onTap: (index) {
//           // Your existing code for handling bottom navigation
//         },
//       ),
//     );
//   }
//
//   Widget buildButtonGrid(BuildContext context) {
//     // Your existing code for building the button grid
//     return Container();
//   }
//
//   Widget buildSectionOptions(BuildContext context) {
//     // Your existing code for building section options
//     return Container();
//   }
//
//   Widget buildGoalButton(BuildContext context, String text, String imageUrl) {
//     // Your existing code for building the goal button
//     return Container();
//   }
// }
//
// class Group88 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // ... (Your existing code for Group88)
//       ],
//     );
//   }
// }
