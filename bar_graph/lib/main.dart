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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Charts Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<UnitsCalculated> data = [];

  @override
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bar Graph'),
      ),
      body: Center(
        child: Container(
          height: 300,
          padding: EdgeInsets.all(20),
          child: _buildBarChart(),
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
        renderSpec: charts.SmallTickRendererSpec(labelRotation: 45),
      ),
    );
  }
}
