import 'package:dartz/dartz.dart';
import 'package:infomatica_app/core/error/failure.dart';
import 'package:infomatica_app/domain/entities/product.dart';

abstract class ProductRepository{

  Future<Either<Failure, List<Product>>> getProducts();

  // Future<Either<Failure, List<Product>>> getProduct();


}