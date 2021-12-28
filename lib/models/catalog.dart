class CatalogModel {
  static final items = [
    Item(
        id: 1,
        name: "Iphone 13 Pro Max",
        desc: "Iphone 13 Genration",
        price: 1999,
        color: "#fab21a",
        url:
            "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-13-pro-max-silver-select?wid=470&hei=556&fmt=jpeg")
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String url;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.url});
}
