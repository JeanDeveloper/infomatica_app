
import 'dart:convert';

import 'package:infomatica_app/data/models/category_model.dart';
import 'package:infomatica_app/domain/entities/subcategory.dart';

// List<SubCategoryModel> subCategoryModelFromJson(String str) => List<SubCategoryModel>.from(json.decode(str).map((x) => SubCategoryModel.fromJson(x)));

List<SubCategoryModel> subCategoryModelFromJson( List<dynamic> jsonList ){
  return jsonList.map(
    (e) => SubCategoryModel.fromJson(e as Map<String, dynamic>),
  ).toList();
}


// String subCategoryModelToJson(List<SubCategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubCategoryModel extends SubCategory{
  SubCategoryModel({
    required super.name, 
    required super.categoryId,
    super.id,
    super.category
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) => SubCategoryModel(
      id: json["id"],
      name: json["name"],
      categoryId: json["categoryId"],
      category: CategoryModel.fromJson(json["category"]),
  );

  // Map<String, dynamic> toJson() => {
  //     "id": id,
  //     "name": name,
  //     "categoryId": categoryId,
  //     "category": category.toJson(),
  // };
}
