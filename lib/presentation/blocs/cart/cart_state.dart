part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

class CartProductListLoading extends CartState {}

class CartProductListLoaded extends CartState{
  final List<Product> productsSelected;
  CartProductListLoaded(this.productsSelected);
}

class CartProductListError extends CartState{
  final String message;
  CartProductListError(this.message);
}

