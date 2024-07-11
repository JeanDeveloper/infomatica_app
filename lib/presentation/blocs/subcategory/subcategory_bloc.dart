import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:infomatica_app/core/error/failure.dart';
import 'package:infomatica_app/domain/caseuses/subcategory/get_subcategories.dart';
import 'package:infomatica_app/domain/entities/subcategory.dart';
import 'package:meta/meta.dart';

part 'subcategory_event.dart';
part 'subcategory_state.dart';

class SubcategoryBloc extends Bloc<SubcategoryEvent, SubcategoryState> {
  final GetSubCategoriesUseCase getSubCategoriesUseCase;
  SubcategoryBloc(
    this.getSubCategoriesUseCase
  ) : super(SubcategoryInitial()) {
    on<SubcategoryEvent>((event, emit) async {
      // TODO: implement event handler

      if( event is InitialEvent ){
        emit( SubCategoryListLoading() );
        final orderList = await getSubCategoriesUseCase();
        emit(_failureOrSuccess(orderList));
      }

    });
  }


  SubcategoryState _failureOrSuccess(Either<Failure, List<SubCategory>> failureOrSuccess){
    return failureOrSuccess.fold(
      (failure) => SubCategoryListError(_mapFailureToMessage(failure)), 
      (list) {
        return SubCategoryListLoaded(list);
      }
    );
  }

  String _mapFailureToMessage( Failure failure ){
    switch (failure.runtimeType) {
      case ServerFailure _:
        return "Ha ocurrido un error, Por favor intenta denuevo";
      default:
        return "Error inesperado";
    }
  }

}
