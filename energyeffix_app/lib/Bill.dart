import 'package:flutter/material.dart';
import 'package:energyeffix_app/Components/CustomAppBar.dart';
import 'package:energyeffix_app/Components/CustomDrawer.dart';

class Bill extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(
          toolbarHeight: 120,
        ),
        title: "My Bill",
      ),
      drawer: CustomDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            child: DataTable(
              columnSpacing: 8,
              columns: [
                DataColumn(
                  label: Text(
                    'Description',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Units',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Price Per Unit',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Price',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
              rows: List<DataRow>.generate(
                10,
                (index) => DataRow(
                  cells: [
                    DataCell(Text('Description ${index + 1}')),
                    DataCell(Text('Units ${index + 1}')),
                    DataCell(Text('Price Per Unit ${index + 1}')),
                    DataCell(Text('Price ${index + 1}')),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
