import 'package:flutter/material.dart';

class ManualEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manual Reading Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ManualReadingPage(),
    );
  }
}

class ManualReadingPage extends StatefulWidget {
  @override
  _ManualReadingPageState createState() => _ManualReadingPageState();
}

class _ManualReadingPageState extends State<ManualReadingPage> {
  DateTime _meterReadingDate = DateTime.now();
  TimeOfDay _meterReadingTime = TimeOfDay.now();
  int? _manualReadUnits;
  bool _isSaved = false;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Manual Reading Page'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [Colors.white, Color(0xEA19B6D6)],
          ),
          borderRadius: BorderRadius.circular(32),
        ),
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Manual Reading',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              color: Colors.black,
              padding: EdgeInsets.all(20.0),
              margin: EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Meter Reading Date',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  GestureDetector(
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: _meterReadingDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      ).then((pickedDate) {
                        if (pickedDate != null) {
                          setState(() {
                            _meterReadingDate = pickedDate;
                          });
                        }
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.white, Color(0xEA19B6D6)],
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Text(
                        '${_meterReadingDate.year}-${_meterReadingDate.month}-${_meterReadingDate.day}',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Meter Reading Time',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  GestureDetector(
                    onTap: () {
                      showTimePicker(
                        context: context,
                        initialTime: _meterReadingTime,
                      ).then((pickedTime) {
                        if (pickedTime != null) {
                          setState(() {
                            _meterReadingTime = pickedTime;
                          });
                        }
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.white, Color(0xEA19B6D6)],
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Text(
                        '${_meterReadingTime.hour}:${_meterReadingTime.minute}',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    constraints: BoxConstraints(
                      minWidth: deviceWidth * 0.6, // Adjust according to your requirement
                      maxWidth: deviceWidth * 0.8, // Adjust according to your requirement
                    ),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          _manualReadUnits = int.tryParse(value);
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Meter Value',
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white, // Use the same gradient color
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white, // Use the same gradient color
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.white, Color(0xEA19B6D6)],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // Save button logic
                      // Assuming saving to database here
                      setState(() {
                        _isSaved = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(deviceWidth * 0.2, 50), // Adjust according to your requirement
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text('Save'),
                  ),
                ),
                SizedBox(width: 10.0),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.white, Color(0xEA19B6D6)],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ElevatedButton(
                    onPressed: _isSaved
                        ? () {
                            // Analyze button logic
                            // Show overlay screen dialog box
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Analysis Dialog'),
                                  content: Text('Previous meter readings and history graph'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Close'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(deviceWidth * 0.2, 50), // Adjust according to your requirement
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text('Analyze'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
