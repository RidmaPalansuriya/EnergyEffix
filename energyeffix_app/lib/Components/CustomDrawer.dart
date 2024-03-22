import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
    child: ListView(
    children: [
    DrawerHeader(
    decoration: BoxDecoration(
    color: Color(0xff0071aa),
    ),
    child: Text(
    'Drawer Header',
    style: TextStyle(
    color: Colors.white,
    fontSize: 24,
    ),
    ),
    ),
    ListTile(
    title: Text('Ridma'),
    onTap: () {
    Navigator.pop(context);
    },
    ),
    ListTile(
    title: Text('Palansuriya'),
    onTap: () {
    Navigator.pop(context);
    },
    ),
    ],
    ),
    );
  }

}