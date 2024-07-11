import 'package:infomatica_app/domain/entities/category.dart';


List<CategoryModel> categoryModelFromJson( List<dynamic> jsonList ){
  return jsonList.map(
    (e) => CategoryModel.fromJson(e as Map<String, dynamic>),
  ).toList();
}



class CategoryModel extends Category{

  CategoryModel({
    super.id,
    required super.name
  });

  factory CategoryModel.fromJson(json){
    return CategoryModel(
      id:json['id'], 
      name: json['name'], 
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'id':id,
      'name': name
    };
  }

  factory CategoryModel.fromEntity(Category category){
    return CategoryModel(
      id: category.id,
      name: category.name,
    );
  }



}