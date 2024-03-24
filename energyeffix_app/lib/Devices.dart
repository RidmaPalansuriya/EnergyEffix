import 'package:flutter/material.dart';

class Devices extends StatefulWidget {
  @override
  _DevicesState createState() => _DevicesState();
}

class _DevicesState extends State<Devices> {
  bool _allowAccess = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1D1E33),
      appBar: CustomAppBar(
        appBar: AppBar(
          toolbarHeight: 120,
        ),
        title: "Add Device     ",
      ),
      drawer: CustomDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Serial Number',
                    fillColor: Color(0xFF0EC6EC),
                    filled: true,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Meter ID',
                    fillColor: Color(0xFF0EC6EC),
                    filled: true,
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _allowAccess = !_allowAccess;
                    });
                  },
                  child: Row(
                    children: [
                      Checkbox(
                        value: _allowAccess,
                        onChanged: (value) {
                          setState(() {
                            _allowAccess = value!;
                          });
                        },
                        activeColor: Colors.white,
                        checkColor: Colors.black,
                      ),
                      Text(
                        'Allow access to the Smart Meter',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 0,
            child: FloatingActionButton.extended(
              onPressed: () {},
              label: Text('Add Device'),
              icon: Icon(Icons.add),
              backgroundColor: Color(0xFF0EC6EC),
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28.0),
              ),
              isExtended: true,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              extendedPadding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.6),
            ),
          ),
        ],
      ),
    );
  }
}