import 'package:meta/meta.dart';
import 'dart:convert';

class ProductResponseModel {
  final List<Product> products;
  final String messsage;

  ProductResponseModel({
    required this.products,
    required this.messsage,
  });

  factory ProductResponseModel.fromJson(String str) => ProductResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductResponseModel.fromMap(Map<String, dynamic> json) => ProductResponseModel(
    products: List<Product>.from(json["products"].map((x) => Product.fromMap(x))),
    messsage: json["messsage"],
  );

  Map<String, dynamic> toMap() => {
    "products": List<dynamic>.from(products.map((x) => x.toMap())),
    "messsage": messsage,
  };
}

class Product {
  final int id;
  final String name;
  final String description;
  final int price;
  final int stock;
  final Category category;
  final String image;
  final DateTime createdAt;
  final DateTime updatedAt;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.category,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    description: json["description"] ?? "",
    price: json["price"],
    stock: json["stock"],
    category: categoryValues.map[json["category"]]!,
    image: json["image"] ?? "",
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "description": description,
    "price": price,
    "stock": stock,
    "category": categoryValues.reverse[category],
    "image": image,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

enum Category {
  FOOD,
  SNACK
}

final categoryValues = EnumValues({
  "food": Category.FOOD,
  "snack": Category.SNACK
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
