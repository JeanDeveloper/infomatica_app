
import 'package:dartz/dartz.dart';
import 'package:infomatica_app/core/error/failure.dart';
import 'package:infomatica_app/domain/entities/product.dart';
import 'package:infomatica_app/domain/repositories/product_repository.dart';

class GetProductsUseCase{

  final ProductRepository repository;

  GetProductsUseCase({
    required this.repository
  });

  Future<Either<Failure, List<Product>>> call(){
    return repository.getProducts();
  }

}