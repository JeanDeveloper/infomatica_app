import 'package:infomatica_app/domain/entities/category.dart';

class Subcategory{

  int? id;
  String name;
  Category category;

  Subcategory({
    this.id,
    required this.name,
    required this.category
  });


}