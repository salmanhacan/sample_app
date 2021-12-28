import 'package:flutter/material.dart';
import 'package:sample_app/widgets/drawer.dart';

class Home extends StatelessWidget {
  final String home = "Catalog App";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$home"),
      ),
      body: Center(
        child: Text("This is sample $home"),
      ),
      drawer: MyDrawer(),
    );
  }
}
