import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:infomatica_app/core/error/failure.dart';
import 'package:infomatica_app/domain/caseuses/sale/get_sales.dart';
import 'package:infomatica_app/domain/caseuses/sale/register_sale.dart';
import 'package:infomatica_app/domain/entities/product.dart';
import 'package:infomatica_app/domain/entities/sale.dart';
import 'package:infomatica_app/presentation/blocs/cart/cart_bloc.dart';
import 'package:meta/meta.dart';

part 'sale_event.dart';
part 'sale_state.dart';

class SaleBloc extends Bloc<SaleEvent, SaleState> {

  final GetSalesUseCase getSalesUseCase;
  final RegisterSaleUseCase registerSaleUseCase;
  // final CartBloc cartBloc;

  SaleBloc(
    this.getSalesUseCase, 
    this.registerSaleUseCase, 
    // this.cartBloc
  ) : super(SaleInitial()) {
    on<SaleEvent>((event, emit) async {

      if( event is InitialEvent ){
        emit( SaleListLoading() );
        final orderList = await getSalesUseCase();
        emit(_failureOrSuccess(orderList));
      }

      if( event is  CreateSaleEvent ){
        emit( SaleListLoading() );
        await registerSaleUseCase( event.selectedProducts );
        // cartBloc.add(ClearCart());
        final orderList = await getSalesUseCase();
        emit(_failureOrSuccess(orderList));
      }

    });
  }

  SaleState _failureOrSuccess(Either<Failure, List<Sale>> failureOrSuccess){
    return failureOrSuccess.fold(
      (failure) => SaleListError(_mapFailureToMessage(failure)), 
      (list) {
        return SaleListLoaded(list);
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
