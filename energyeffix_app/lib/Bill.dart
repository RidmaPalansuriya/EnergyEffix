import 'package:flutter/material.dart';
import 'package:energyeffix_app/Components/CustomAppBar.dart';
import 'package:energyeffix_app/Components/CustomDrawer.dart';
import 'package:energyeffix_app/Components/MyDrawer.dart';

class Bill extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller;
    return Scaffold(
      appBar: CustomAppBar(appBar: AppBar(), title: "My Bill"),
      
      body: Center(
        child: Text('This is your Bill'),
      ),
    );
  }
}