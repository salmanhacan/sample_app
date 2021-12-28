import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sample_app/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;
  const ItemWidget({Key? key, required this.item})
      : assert(Item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(item.url),
        title: Text(item.name, textScaleFactor: 1.0),
        subtitle: Text(item.desc),
        trailing: Text("\$${item.price}"),
        onTap: () {
          "item Pressed";
        },
      ),
    );
  }
}
