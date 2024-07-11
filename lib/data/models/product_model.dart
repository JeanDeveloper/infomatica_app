import 'package:infomatica_app/data/models/category_model.dart';
import 'package:infomatica_app/domain/entities/product.dart';

List<ProductModel> productModelFromJson( List<dynamic> jsonList ){
  return jsonList.map(
    (e) => ProductModel.fromJson(e as Map<String, dynamic>),
  ).toList();
}

class ProductModel extends Product{

  ProductModel({
    required super.id, 
    required super.name, 
    required super.description, 
    required super.price, 
    required super.categoryId, 
    required super.category
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    price: json["price"]?.toDouble(),
    categoryId: json["categoryId"],
    category: (json["category"] == null) ? null  : CategoryModel.fromJson(json["category"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "price": price,
    "categoryId": categoryId,
    "category": category,
  };

}
