import 'package:dartz/dartz.dart';
import 'package:infomatica_app/core/error/failure.dart';
import 'package:infomatica_app/domain/entities/product.dart';
import 'package:infomatica_app/domain/entities/sale.dart';

abstract class SaleRepository{

  Future<Either<Failure, List<Sale>>> getSales();
  Future<Either<Failure, bool>> registerSale(List<Product> products);

  // Future<Either<Failure, Category>> getCategory(int id);
  // Future<Either<Failure, bool>> registerCategory(Category cat);
  // Future<Either<Failure, bool>> updateCategory(int id, Category cat);
  // Future<Either<Failure, bool>> deleteCategory(int id);

}