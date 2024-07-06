import 'package:dartz/dartz.dart';
import 'package:infomatica_app/core/error/failure.dart';
import 'package:infomatica_app/domain/entities/category.dart';

abstract class CategoryRepository{

  Future<Either<Failure, List<Category>>> getCategories();

  Future<Either<Failure, Category>> getCategory(int id);

  Future<Either<Failure, bool>> registerCategory(Category cat);

  Future<Either<Failure, bool>> updateCategory(int id, Category cat);

  Future<Either<Failure, bool>> deleteCategory(int id);

}