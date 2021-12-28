import 'package:flutter/material.dart';
import 'package:sample_app/models/catalog.dart';
import 'package:sample_app/widgets/drawer.dart';
import 'package:sample_app/widgets/item_widget.dart';

class Home extends StatelessWidget {
  final String home = "Catalog App";

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(15, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text("$home"),
      ),
      body: ListView.builder(
        itemCount: dummyList.length,
        itemBuilder: (context, index) {
          return ItemWidget(item: dummyList[index]);
        },
      ),
      drawer: MyDrawer(),
    );
  }
}
