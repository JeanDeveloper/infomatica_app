import 'package:dartz/dartz.dart';
import 'package:infomatica_app/core/error/failure.dart';
import 'package:infomatica_app/data/datasource/infomatica_remote_datasource.dart';
import 'package:infomatica_app/domain/entities/product.dart';
import 'package:infomatica_app/domain/repositories/product_repository.dart';


class ProductRepositoryImpl implements ProductRepository{

  final InfomaticaRemoteDatasource infomaticaRemoteDataSource;
  ProductRepositoryImpl({required this.infomaticaRemoteDataSource});

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      final List<Product> resp =  await infomaticaRemoteDataSource.getProducts();
      return Right(resp);
    } on LocalFailure {
      return Left(LocalFailure());
    }
  }

}