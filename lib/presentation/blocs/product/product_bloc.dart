import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:infomatica_app/core/error/failure.dart';
import 'package:infomatica_app/domain/caseuses/product/get_products.dart';
import 'package:infomatica_app/domain/entities/product.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {

  final GetProductsUseCase getProductsUseCase;

  ProductBloc(
    this.getProductsUseCase,
  ) : super(ProductInitial()) {
    on<ProductEvent>((event, emit) async {

      if( event is InitialEvent ){
        emit( ProductListLoading() );
        final orderList = await getProductsUseCase();
        emit(_failureOrSuccess(orderList));
      }

    });
  }

  ProductState _failureOrSuccess(Either<Failure, List<Product>> failureOrSuccess){
    return failureOrSuccess.fold(
      (failure) => ProductListError(_mapFailureToMessage(failure)), 
      (list) {
        return ProductListLoaded(list);
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
