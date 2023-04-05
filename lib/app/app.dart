import 'package:flutter/material.dart';

import 'package:snagging/presentation/root_screen/root_screen.dart';
import 'package:snagging/presentation/s.dart';


import '../presentation/home/home_screen.dart';
import '../presentation/resources/ruotes.dart';
import '../presentation/resources/theme_manager.dart';


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      home:HomeScreen(),
      theme:  getApplicationTheme(),
    );
  }
}
