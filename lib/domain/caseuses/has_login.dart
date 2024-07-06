
import 'package:dartz/dartz.dart';
import 'package:infomatica_app/core/error/failure.dart';
import 'package:infomatica_app/domain/entities/user.dart';
import 'package:infomatica_app/domain/repositories/auth_repository.dart';

class HasLoginUseCase{
  
  final AuthRepository repository;

  HasLoginUseCase({
    required this.repository
  });

  Future<Either<Failure,User>> call(String username, String password){
    return repository.login(username, password);
  }

}