import 'package:flutter/material.dart';
import 'package:imaginamos_test/detail_screen.dart';

import 'package:imaginamos_test/home_screen.dart';

class AppRouter {
  static const initialRoute = 'HomeScreen';

  static Map<String, Widget Function(BuildContext)> routes = {
    'HomeScreen': (_) => const HomeScreen(),
    'DetailScreen': (_) => const DetailScreen()
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) =>
      MaterialPageRoute(builder: (context) => const HomeScreen());
}
