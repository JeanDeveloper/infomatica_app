import 'package:dartz/dartz.dart';
import 'package:infomatica_app/core/error/failure.dart';
import 'package:infomatica_app/data/datasource/infomatica_remote_datasource.dart';
import 'package:infomatica_app/domain/entities/user.dart';
import 'package:infomatica_app/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{

  final InfomaticaRemoteDatasource infomaticaRemoteDataSource;

  AuthRepositoryImpl({required this.infomaticaRemoteDataSource});

  @override
  Future<Either<Failure, User>> login(String username, String password) async {
    try {
      final User user = await infomaticaRemoteDataSource.login(username, password);
      return Right(user);
    } on LocalFailure {
      return Left(LocalFailure());
    }
  }

}