import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

void main() {
  runApp(MyApp());
}

class UnitsCalculated {
  final String day;
  final int units;

  UnitsCalculated(this.day, this.units);
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

class MyHomePage extends StatelessWidget {
  List<UnitsCalculated> data = [
    UnitsCalculated('Mon', 3),
    UnitsCalculated('Tue', 5),
    UnitsCalculated('Wed', 4),
    UnitsCalculated('Thu', 4),
    UnitsCalculated('Fri', 6),
    UnitsCalculated('Sat', 3),
    UnitsCalculated('Sun', 5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bar Chart'),
      ),
      body: Center(
        child: Container(
          height: 300,
          padding: EdgeInsets.all(16),
          child: _buildBarChart(),
        ),
      ),
    );
  }

  Widget _buildBarChart() {
    List<charts.Series<UnitsCalculated, String>> series = [
      charts.Series(
        id: 'Population',
        data: data,
        domainFn: (UnitsCalculated series, _) => series.day,
        measureFn: (UnitsCalculated series, _) => series.units,
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
