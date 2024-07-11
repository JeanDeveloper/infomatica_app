
import 'package:dartz/dartz.dart';
import 'package:infomatica_app/core/error/failure.dart';
import 'package:infomatica_app/domain/entities/product.dart';
import 'package:infomatica_app/domain/repositories/sale_repository.dart';

class RegisterSaleUseCase{
  
  final SaleRepository repository;

  RegisterSaleUseCase({ required this.repository });

  Future<Either<Failure, bool>> call(List<Product> products){
    return repository.registerSale(products);
  }

}