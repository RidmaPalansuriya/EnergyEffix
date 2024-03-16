import 'package:flutter/material.dart';

class ManualEntry extends StatefulWidget {
  @override
  _ManualEntryState createState() => _ManualEntryState();
}

class _ManualEntryState extends State<ManualEntry> {
  DateTime _selectedDate = DateTime.now();
  bool _customPreviousReading = false;
  DateTime _previousReadingDate = DateTime.now();
  String _meterValue = '';
  String _unitType = 'kWh';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manual Entry'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Last Added Meter Reading Details'),
            SizedBox(height: 10),
            Text('Date: 2nd June 2023'),
            SizedBox(height: 10),
            Text('Meter Value: 16781kWh'),
            SizedBox(height: 20),
            CheckboxListTile(
              title: Text('Custom Previous Reading'),
              value: _customPreviousReading,
              onChanged: (bool? value) {
                setState(() {
                  _customPreviousReading = value!;
                });
              },
            ),
            if (_customPreviousReading)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Previous Reading Date'),
                  ElevatedButton(
                    onPressed: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: _previousReadingDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime.now(),
                      );
                      if (picked != null && picked != _previousReadingDate)
                        setState(() {
                          _previousReadingDate = picked;
                        });
                    },
                    child: Text(
                      'Select Date',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Text('Meter Value'),
                  TextField(
                    onChanged: (String value) {
                      setState(() {
                        _meterValue = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Meter Value',
                      suffixText: _unitType,
                    ),
                  ),
                ],
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add meter reading logic here
              },
              child: Text('Add Meter Reading'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Analyze reading logic here
              },
              child: Text('Analyze Reading'),
            ),
          ],
        ),
      ),
    );
  }
}
