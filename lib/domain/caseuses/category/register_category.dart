import 'package:dartz/dartz.dart';
import 'package:infomatica_app/core/error/failure.dart';
import 'package:infomatica_app/domain/entities/category.dart';
import 'package:infomatica_app/domain/repositories/category_repository.dart';

class RegisterCategoryUseCase{
  
  final CategoryRepository repository;

  RegisterCategoryUseCase({
    required this.repository
  });

  Future<Either<Failure, bool>> call(Category cat) async {
    return repository.registerCategory(cat);
  }

}