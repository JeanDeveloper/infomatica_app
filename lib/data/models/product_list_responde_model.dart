// To parse this JSON data, do
//
//     final productListResponse = productListResponseFromJson(jsonString);

import 'dart:convert';

ProductListResponse productListResponseFromJson(String str) => ProductListResponse.fromJson(json.decode(str));

String productListResponseToJson(ProductListResponse data) => json.encode(data.toJson());

class ProductListResponse {
  String id;
  List<Product> values;

  ProductListResponse({
    required this.id,
    required this.values,
  });

  factory ProductListResponse.fromJson(Map<String, dynamic> json) => ProductListResponse(
    id: json["\u0024id"],
    values: List<Product>.from(json["\u0024values"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "\u0024values": List<dynamic>.from(values.map((x) => x.toJson())),
  };
}

class Product {
  String id;
  int valueId;
  String name;
  String description;
  double price;
  int categoryId;
  Category category;

  Product({
    required this.id,
    required this.valueId,
    required this.name,
    required this.description,
    required this.price,
    required this.categoryId,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["\u0024id"],
    valueId: json["id"],
    name: json["name"],
    description: json["description"],
    price: json["price"]?.toDouble(),
    categoryId: json["categoryId"],
    category: Category.fromJson(json["category"]),
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "id": valueId,
    "name": name,
    "description": description,
    "price": price,
    "categoryId": categoryId,
    "category": category.toJson(),
  };
}

class Category {
    String? id;
    int? categoryId;
    String? name;
    String? ref;

    Category({
        this.id,
        this.categoryId,
        this.name,
        this.ref,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["\u0024id"],
        categoryId: json["id"],
        name: json["name"],
        ref: json["\u0024ref"],
    );

    Map<String, dynamic> toJson() => {
        "\u0024id": id,
        "id": categoryId,
        "name": name,
        "\u0024ref": ref,
    };
}
