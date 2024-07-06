import 'package:infomatica_app/domain/entities/category.dart';

class Product{
  int? id;
  String name;
  String description;
  double price;

  Category category;

  Product({
    this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
  });


}