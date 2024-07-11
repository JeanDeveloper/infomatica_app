import 'package:dartz/dartz.dart';
import 'package:infomatica_app/core/error/failure.dart';
import 'package:infomatica_app/data/datasource/infomatica_remote_datasource.dart';
import 'package:infomatica_app/domain/entities/category.dart';
import 'package:infomatica_app/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository{

  final InfomaticaRemoteDatasource infomaticaRemoteDataSource;
  CategoryRepositoryImpl({required this.infomaticaRemoteDataSource});

  @override
  Future<Either<Failure, bool>> deleteCategory(int id) async {
    try {
      final bool resp = await infomaticaRemoteDataSource.deleteCategory(id);
      return Right(resp);
    } on LocalFailure {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    try {
      final List<Category> resp =  await infomaticaRemoteDataSource.getCategories();
      return Right(resp);
    } on LocalFailure {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, Category>> getCategory(int id) {
    // TODO: implement getCategory
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> registerCategory(Category cat) async {
    try {
      final bool resp = await infomaticaRemoteDataSource.registerCategory(cat);
      return Right(resp);
    } on LocalFailure {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> updateCategory(int id, Category cat) {
    // TODO: implement updateCategory
    throw UnimplementedError();
  }


}