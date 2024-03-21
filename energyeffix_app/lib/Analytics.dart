// import 'package:energyeffix_app/Components/CustomAppBar.dart';
// import 'package:energyeffix_app/Components/CustomDrawer.dart';
// import 'package:flutter/material.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'goal.dart'; // Import your Goal widget

// class Analytics extends StatefulWidget {
//   @override
//   _AnalyticsState createState() => _AnalyticsState();
// }

// class _AnalyticsState extends State<Analytics> {
//   GlobalKey<CurvedNavigationBarState> _curvednavigationkey = GlobalKey();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(appBar: AppBar(
//         toolbarHeight: 100,
//       ), title: "Analytics"),
//       drawer: CustomDrawer(),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//               width: 265,
//               height: 44.93,
//               child: Text(
//                 'Your Energy Usage',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontFamily: 'Eras Bold ITC',
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: CurvedNavigationBar(
//         key: _curvednavigationkey,
//         index: 0,
//         height: 56,
//         color: Colors.transparent,
//         buttonBackgroundColor: Color(0xff1D1E33),
//         backgroundColor: Color(0xff0071aa),
//         animationCurve: Curves.easeInOut,
//         animationDuration: const Duration(milliseconds: 400),
//         items: const <Widget>[


//           Icon(Icons.home_rounded, size: 26, color: Colors.white),
//           Icon(Icons.analytics, size: 26, color: Colors.white),
//           Icon(Icons.star, size: 26, color: Colors.white),
//           Icon(Icons.attach_money_rounded, size: 26, color: Colors.white),
//           Icon(Icons.devices, size: 26, color: Colors.white),
//         ],
//         onTap: (index) {
//           if (index == 2) {
//             Navigator.pushNamed(context, '/goal');
//           } else {
//             setState(() {
//               _intPage = index;
//             });
//           }
//         },
//       ),
//     );
//   }
// }
