import 'package:flutter/material.dart';
import 'package:sample_app/routes.dart';
import 'package:sample_app/screens/login.dart';
import 'package:sample_app/widgets/theme.dart';

import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheme.LightTheme(context),
      darkTheme: MyTheme.DarkTheme(context),
      initialRoute: MyRoutes.loginRoutes,
      debugShowCheckedModeBanner: false,
      routes: {
        MyRoutes.loginRoutes: (context) => Login(),
        MyRoutes.homeRoutes: (context) => Home(),
      },
    );
  }
}
