import 'package:dartz/dartz.dart';
import 'package:infomatica_app/core/error/failure.dart';
import 'package:infomatica_app/domain/entities/user.dart';

abstract class AuthRepository{

  Future<Either<Failure, User>> login(String username, String password);

}