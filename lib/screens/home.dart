import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample_app/models/catalog.dart';
import 'package:sample_app/widgets/drawer.dart';
import 'package:sample_app/widgets/item_widget.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String home = "Catalog App";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final decodeJson = jsonDecode(catalogJson);
    var productData = decodeJson["products"];
    CatalogModel.items =
        List.from(productData).map((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //final dummyList = List.generate(15, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text("$home"),
      ),
      body: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
          ? GridView.builder(
              itemCount: CatalogModel.items.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) {
                final item = CatalogModel.items[index];
                return Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: GridTile(
                    header: Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        item.name,
                        textScaleFactor: 1.2,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                      ),
                    ),
                    child: Image.network(item.url),
                    footer: Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Price: \$${item.price}",
                        textScaleFactor: 1.2,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                    ),
                  ),
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
      drawer: MyDrawer(),
    );
  }
}
