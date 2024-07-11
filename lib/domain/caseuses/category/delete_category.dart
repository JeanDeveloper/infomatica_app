import 'package:dartz/dartz.dart';
import 'package:infomatica_app/core/error/failure.dart';
import 'package:infomatica_app/domain/repositories/category_repository.dart';

class DeleteCategoryUseCase{
  
  final CategoryRepository repository;

  DeleteCategoryUseCase({
    required this.repository
  });

  Future<Either<Failure, bool>> call(int id) async {
    return repository.deleteCategory(id);
  }

}