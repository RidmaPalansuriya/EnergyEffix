import 'package:flutter/material.dart';
import 'Analytics.dart';
import 'Goal.dart';
import 'Bill.dart';

class DevicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Devices'),
      ),
      body: Center(
        child: Text('Devices Page Content'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 3, // Set the index of the active button (Devices)
        onTap: (index) {
          // Handle navigation when a tab is tapped
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/analytics');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/goal');
              break;
            case 2:
              Navigator.pushReplacementNamed(context, '/bill');
              break;
            case 3:
            // Current page, do nothing or add additional logic if needed
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Goal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Bill',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.devices),
            label: 'Devices',
          ),
        ],
      ),
    );
  }
}


