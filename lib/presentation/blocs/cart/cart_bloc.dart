import 'package:bloc/bloc.dart';
import 'package:infomatica_app/domain/entities/product.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {

  List<Product> productsSelected = [];

  CartBloc() : super(CartInitial()) {
    on<CartEvent>((event, emit) {

      // if( event is InitialEvent ){
      //   emit( CartProductListLoading() );
      //   emit(  CartProductListLoaded(productsSelected) );
      // }

      if( event is AddProductToCart ){
        emit( CartProductListLoading() );
        productsSelected.add(event.product);
        emit( CartProductListLoaded(productsSelected) );
      }

      if( event is ClearCart ){
        emit( CartProductListLoading() );
        productsSelected.clear();
        emit( CartProductListLoaded(productsSelected) );
      }

    });
  }
}
