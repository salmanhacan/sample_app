import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final String home = "Home Title";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("$home"),
      ),
      body: Center(
        child: Text("This is sample $home"),
      ),
      drawer: Drawer(),
    );
  }
}
