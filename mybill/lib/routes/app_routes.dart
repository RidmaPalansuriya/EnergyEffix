import 'package:flutter/material.dart';
import '../presentation/my_bill_screen/my_bill_screen.dart';

class AppRoutes {
  static const String myBillScreen = '/my_bill_screen';

  static Map<String, WidgetBuilder> routes = {
    myBillScreen: (context) => MyBillScreen()
  };
}
