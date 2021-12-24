import 'package:flutter/material.dart';
import 'package:sample_app/screens/login.dart';

import 'screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: "/home",
      routes: {
        "/": (context) => Login(),
        "/login": (context) => Login(),
        "/home": (context) => Home(),
      },
    );
  }
}
