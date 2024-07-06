import 'package:get_it/get_it.dart';
import 'package:infomatica_app/data/datasource/infomatica_remote_datasource.dart';
import 'package:infomatica_app/data/repositories/auth_repository_impl.dart';
import 'package:infomatica_app/domain/caseuses/has_login.dart';
import 'package:infomatica_app/domain/repositories/auth_repository.dart';
import 'package:infomatica_app/presentation/blocs/auth/auth_bloc.dart';
import 'package:infomatica_app/presentation/blocs/main/main_bloc.dart';

final di = GetIt.instance;

Future<void> init() async {

  //BLOC
  di.registerFactory(()=> AuthBloc( di() ));
  di.registerFactory(()=> MainBloc(  ));

  //USE CASE
  di.registerFactory(() => HasLoginUseCase(repository: di()));

  //REPOSITORY
  di.registerFactory<AuthRepository>(() => AuthRepositoryImpl(
    infomaticaRemoteDataSource: di(),
  ));

  //DATASOURCE
  di.registerFactory<InfomaticaRemoteDatasource>(() => InfomaticaRemoteDatasourceImpl());

}