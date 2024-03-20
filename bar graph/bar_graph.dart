import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'bar_data.dart';

class MyBarGraph extends StatelessWidget {
  final List weeklySummary; //[mondayAmount, tuesdayAmount,...]
  const MyBarGraph({
    super.key,
    required this.weeklySummary,
  });

  @override
  Widget build(BuildContext context) {
    //initialize bar data
    BarData myBarData = BarData(
        mondayAmount: weeklySummary[0],
        tuesdayAmount: weeklySummary[1],
        wednesdayAmount: weeklySummary[2],
        thursdayAmount: weeklySummary[3],
        fridayAmount: weeklySummary[4],
        saturdayAmount: weeklySummary[5],
        sundayAmount: weeklySummary[6]
    );

    myBarData.initializeBarData();

    return BarChart(
      BarChartData(
        maxY: 100,
        minY: 0,
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles:false))
          ),
        barGroups: myBarData.barData
          .map(
            (data) => BarChartGroupData(x: data.x,
            barRods: [
              BarChartRodData(
                toY: data.y, 
                color: Colors.grey[800],
                width: 25,
                borderRadius: BorderRadius.circular(4),
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  toY: 10,
                  color: Colors.grey[200],
                )
             ),
            ],
          ),
        )
          .toList(),
      ),
    );
  }
}
