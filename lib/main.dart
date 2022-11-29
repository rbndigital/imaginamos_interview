import 'package:flutter/material.dart';
import 'package:imaginamos_test/router/app_route.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movie App',
        initialRoute: AppRouter.initialRoute,
        routes: AppRouter.routes,
        onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings));
  }
}
