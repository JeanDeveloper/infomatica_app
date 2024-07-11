import 'package:infomatica_app/domain/entities/category.dart';

class SubCategory {
  int? id;
  String name;
  int categoryId;
  Category? category;

  SubCategory({
    this.id,
    required this.name,
    required this.categoryId,
    this.category,
  });

}
