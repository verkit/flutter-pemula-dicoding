import 'package:dicoding/ui/widget/category_item.dart';

class Category {
  CategoryItem? name;

  Category({this.name});
}

class Product {
  Product({
    this.name,
    this.type,
    this.subtype,
    this.price,
    this.description,
    this.image,
  });

  String? name;
  String? type;
  String? subtype;
  double? price;
  String? description;
  String? image;

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        name: json["name"],
        type: json["type"],
        subtype: json["subtype"],
        price: json["price"],
        description: json["description"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "type": type,
        "subtype": subtype,
        "price": price,
        "description": description,
        "image": image,
      };
}
