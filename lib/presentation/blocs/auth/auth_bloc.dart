import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:infomatica_app/core/error/failure.dart';
import 'package:infomatica_app/domain/caseuses/has_login.dart';
import 'package:infomatica_app/domain/entities/user.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final HasLoginUseCase _hasLoginUseCase;

  User? user;

  AuthBloc(
    this._hasLoginUseCase
  ) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {

      if(event is DoLoginEvent){
        emit(AuthLoading());
        final failureOrUser =  await _hasLoginUseCase(event.username, event.password);
        emit(_failureOrLogin(failureOrUser));
      }

      if( event is DoLogoutEvent){
        emit(AuthLoading());
        Future.delayed(const Duration(seconds: 1));
        emit(AuthLogout());
      }

    });
  }

  AuthState _failureOrLogin(Either<Failure, User> failureOrLogin){
    return failureOrLogin.fold(
      (failure) => AuthError(_mapFailureToMessage(failure)), 
      (quser) {
        // saveData(loginResponse);
        user = quser;
        return AuthLoged(quser);
      }
    );
  }

  String _mapFailureToMessage( Failure failure ){
    switch (failure.runtimeType) {
      case ServerFailure:
        return "Ha ocurrido un error, Por favor intenta denuevo";
      default:
        return "Error inesperado";
    }
  }

}

