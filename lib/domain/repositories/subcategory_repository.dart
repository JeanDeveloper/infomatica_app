import 'package:dartz/dartz.dart';
import 'package:infomatica_app/core/error/failure.dart';
import 'package:infomatica_app/domain/entities/subcategory.dart';

abstract class SubCategoryRepository{

  Future<Either<Failure, List<SubCategory>>> getSubCategory();

  // Future<Either<Failure, List<Product>>> getProduct();


}