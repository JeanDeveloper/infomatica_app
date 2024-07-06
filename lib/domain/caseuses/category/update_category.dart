import 'package:dartz/dartz.dart';
import 'package:infomatica_app/core/error/failure.dart';
import 'package:infomatica_app/domain/entities/category.dart';
import 'package:infomatica_app/domain/repositories/category_repository.dart';

class UpdateCategoryUseCase{
  
  final CategoryRepository repository;

  UpdateCategoryUseCase({
    required this.repository
  });

  Future<Either<Failure, bool>> call(int id, Category cat) async {
    return repository.updateCategory(id, cat);
  }

}