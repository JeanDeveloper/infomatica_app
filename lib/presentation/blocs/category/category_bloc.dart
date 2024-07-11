import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:infomatica_app/core/error/failure.dart';
import 'package:infomatica_app/domain/caseuses/category/delete_category.dart';
import 'package:infomatica_app/domain/caseuses/category/get_categories.dart';
import 'package:infomatica_app/domain/caseuses/category/register_category.dart';
import 'package:infomatica_app/domain/entities/category.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetCategoriesUseCase getCategoriesUseCase;
  final RegisterCategoryUseCase registerCategoryUseCase;
  final DeleteCategoryUseCase deleteCategoryUseCase;

  CategoryBloc(
    this.getCategoriesUseCase,
    this.registerCategoryUseCase,
    this.deleteCategoryUseCase
  ) : super(CategoryInitial()) {
    on<CategoryEvent>((event, emit) async {

      if( event is InitialEvent ){
        emit( CategoryListLoading() );
        final orderList = await getCategoriesUseCase();
        emit(_failureOrSuccess(orderList));
      }

      if (event is AddCategory) {
        emit(CategoryListLoading() );
        try {
          await registerCategoryUseCase(Category(name: event.name));
          final orderList = await getCategoriesUseCase();
          emit(_failureOrSuccess(orderList));
        } catch (error) {
          // yield CategoryError(error.toString());
        }
      }

      if (event is DeleteCategory) {
        try {
          // emit( CategoryListLoading() );
          await deleteCategoryUseCase(event.id);
          final orderList = await getCategoriesUseCase();
          emit(_failureOrSuccess(orderList));
        } catch (error) {
          // yield CategoryError(error.toString());
        }
      }

    });
  }

  CategoryState _failureOrSuccess(Either<Failure, List<Category>> failureOrSuccess){
    return failureOrSuccess.fold(
      (failure) => CategoryListError(_mapFailureToMessage(failure)), 
      (list) {
        return CategoryListLoaded(list);
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
