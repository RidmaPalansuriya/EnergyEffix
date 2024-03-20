import 'package:data_visualization/bar%20graph/individual_bar.dart';

class BarData {
  final int mondayAmount;
  final int tuesdayAmount;
  final int wednesdayAmount;
  final int thursdayAmount;
  final int fridayAmount;
  final int saturdayAmount;
  final int sundayAmount;

  BarData({
    required this.mondayAmount,
    required this.tuesdayAmount,
    required this.wednesdayAmount,
    required this.thursdayAmount,
    required this.fridayAmount,
    required this.saturdayAmount,
    required this.sundayAmount,
  });

  List<IndividualBar> barData = [];

  void initializeBarData() {
    barData = [
      IndividualBar(x: 0, y: mondayAmount),
      IndividualBar(x: 0, y: tuesdayAmount),
      IndividualBar(x: 0, y: wednesdayAmount),
      IndividualBar(x: 0, y: thursdayAmount),
      IndividualBar(x: 0, y: fridayAmount),
      IndividualBar(x: 0, y: saturdayAmount),
      IndividualBar(x: 0, y: sundayAmount),
    ];
  }
}
