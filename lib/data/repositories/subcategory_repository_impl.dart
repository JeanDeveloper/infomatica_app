import 'package:dartz/dartz.dart';
import 'package:infomatica_app/core/error/failure.dart';
import 'package:infomatica_app/data/datasource/infomatica_remote_datasource.dart';
import 'package:infomatica_app/domain/entities/subcategory.dart';
import 'package:infomatica_app/domain/repositories/subcategory_repository.dart';


class SubCategoryRepositoryImpl implements SubCategoryRepository{

  final InfomaticaRemoteDatasource infomaticaRemoteDataSource;
  SubCategoryRepositoryImpl({required this.infomaticaRemoteDataSource});

  @override
  Future<Either<Failure, List<SubCategory>>> getSubCategory() async {
    try {
      final List<SubCategory> resp =  await infomaticaRemoteDataSource.getSubCategories();
      return Right(resp);
    } on LocalFailure {
      return Left(LocalFailure());
    }
  }

}