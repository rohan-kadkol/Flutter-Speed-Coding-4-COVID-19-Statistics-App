import 'package:covid_19_statistics_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreen.routeName: (context) => HomeScreen()
      },
      theme: ThemeData(
        accentColor: Colors.redAccent
      ),
    );
  }
}
