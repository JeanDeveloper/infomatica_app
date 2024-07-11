
import 'package:dartz/dartz.dart';
import 'package:infomatica_app/core/error/failure.dart';
import 'package:infomatica_app/domain/entities/sale.dart';
import 'package:infomatica_app/domain/repositories/sale_repository.dart';

class GetSalesUseCase{
  
  final SaleRepository repository;

  GetSalesUseCase({
    required this.repository
  });

  Future<Either<Failure, List<Sale>>> call(){
    return repository.getSales();
  }

}