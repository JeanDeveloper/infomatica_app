
import 'package:dartz/dartz.dart';
import 'package:infomatica_app/core/error/failure.dart';
import 'package:infomatica_app/domain/entities/subcategory.dart';
import 'package:infomatica_app/domain/repositories/subcategory_repository.dart';

class GetSubCategoriesUseCase{

  final SubCategoryRepository repository;

  GetSubCategoriesUseCase({ required this.repository });

  Future<Either<Failure, List<SubCategory>>> call(){
    return repository.getSubCategory();
  }

}