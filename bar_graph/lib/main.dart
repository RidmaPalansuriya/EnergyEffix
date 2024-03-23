import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:charts_flutter/flutter.dart' as charts;

void main() {
  runApp(MyApp());
}

class UnitsCalculated {
  final String day;
  final double unit;

  UnitsCalculated(this.day, this.unit);
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Charts Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.blueGrey[900],
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<UnitsCalculated> data = [];

  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('http://192.168.1.3/login_sdgp/post.php'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      setState(() {
        data = jsonData.map((item) => UnitsCalculated(item['day'], double.parse(item['unit']))).toList();
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 80),
            Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey[200],
                borderRadius: BorderRadius.circular(40),
                border: Border.all(color: Colors.blueGrey, width: 5), // Blue border
              ),
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
              margin: EdgeInsets.only(left: 15, right: 15),
              child: Column(
                children: [
                  Text(
                    'Prediction for the month (March 2024)',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '\nkwh:',
                    style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Text(
              'This Week Electricity Usage',
              style: TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Center(
              child: Container(
                height: 300,
                padding: EdgeInsets.all(20),
                child: _buildBarChart(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBarChart() {
    List<charts.Series<UnitsCalculated, String>> series = [
      charts.Series(
        id: 'Units',
        data: data,
        domainFn: (UnitsCalculated datum, _) => datum.day,
        measureFn: (UnitsCalculated datum, _) => datum.unit,
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      )
    ];

    return charts.BarChart(
      series,
      animate: true,
      vertical: true,
      flipVerticalAxis: false,
      barRendererDecorator: charts.BarLabelDecorator<String>(),
      domainAxis: charts.OrdinalAxisSpec(
        renderSpec: charts.SmallTickRendererSpec(
          labelStyle: charts.TextStyleSpec(color: charts.Color.white),
          labelRotation: 45,
        ),
      ),
      primaryMeasureAxis: charts.NumericAxisSpec(
        renderSpec: charts.GridlineRendererSpec(
          labelStyle: charts.TextStyleSpec(color: charts.Color.white),
        ),
      ),
    );
  }
}
