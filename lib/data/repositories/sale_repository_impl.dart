import 'package:dartz/dartz.dart';
import 'package:infomatica_app/core/error/failure.dart';
import 'package:infomatica_app/domain/entities/product.dart';
import 'package:infomatica_app/domain/entities/sale.dart';
import 'package:infomatica_app/domain/repositories/sale_repository.dart';
import 'package:infomatica_app/data/datasource/infomatica_remote_datasource.dart';

class SaleRepositoryImpl implements SaleRepository{

  final InfomaticaRemoteDatasource infomaticaRemoteDataSource;
  SaleRepositoryImpl({required this.infomaticaRemoteDataSource});

  @override
  Future<Either<Failure, List<Sale>>> getSales() async {
    try {
      final List<Sale> resp =  await infomaticaRemoteDataSource.getSales();
      return Right(resp);
    } on LocalFailure {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> registerSale(List<Product> products) async {
    try {
      final bool resp =  await infomaticaRemoteDataSource.registerSale(products);
      return Right(resp);
    } on LocalFailure {
      return Left(LocalFailure());
    }
  }


}