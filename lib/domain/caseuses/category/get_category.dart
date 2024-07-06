
import 'package:dartz/dartz.dart';
import 'package:infomatica_app/core/error/failure.dart';
import 'package:infomatica_app/domain/entities/category.dart';
import 'package:infomatica_app/domain/repositories/category_repository.dart';

class GetCategoryUseCase{
  
  final CategoryRepository repository;

  GetCategoryUseCase({
    required this.repository
  });

  Future<Either<Failure, Category>> call(int id) async {
    return repository.getCategory(id);
  }

}