
import 'package:dartz/dartz.dart';
import 'package:infomatica_app/core/error/failure.dart';
import 'package:infomatica_app/domain/entities/category.dart';
import 'package:infomatica_app/domain/repositories/category_repository.dart';

class GetCategoriesUseCase{
  
  final CategoryRepository repository;

  GetCategoriesUseCase({
    required this.repository
  });

  Future<Either<Failure, List<Category>>> call() async {
    return repository.getCategories();
  }

}